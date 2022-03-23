import os
import multiprocessing
import subprocess
from sympy.ntheory import factorint

# Define cado-nfs file path (relative path; must be updated if location of cado-nfs/ changes)
CADO_NFS_FP = os.path.join('..', '..', 'cado-nfs', 'cado-nfs.py')


def timeout_factorint(n, timeout):
    # Spawn process to factor number, and start it
    process = multiprocessing.Process(target=factorint, args=(n,))
    process.start()

    # Pause execution of main program until process completes or until timeout
    process.join(timeout)

    # If process is still alive at this point, then it timed out so terminate the process and return None
    if process.is_alive():
        process.terminate()
        process.join()  # make sure process terminates before moving on
        return None
    else:
        # Otherwise, return complete factorization
        # (INEFFICIENCY: can't extract return value from initial subprocess,
        # so must factor number again, doubling the runtime)
        return factorint(n)


# From cado-nfs project: https://gitlab.inria.fr/cado-nfs/cado-nfs
def cado_nfs(n):
    output = subprocess.check_output(
        ['python3', CADO_NFS_FP, str(n), '--screenlog', 'ERROR'],
        cwd=os.path.dirname(__file__)
    )
    output = output.decode("utf-8")
    return tuple(sorted(int(i) for i in output.split()))


def corrected_cado_factor(n, *, timeout=15, return_method_used=False):
    # Check if sympy's factorint can factor entry within the timeout length; if not, use cado-nfs
    factors = timeout_factorint(n, timeout=timeout)
    if factors is not None:
        method_used = 'sympy'
        # DONE, skip to return
    else:
        # If sympy's factorint did not factor it fast enough, use cado-nfs (below)

        def product(it):
            prod = 1
            for k in it:
                prod *= k
            return prod

        try:
            cado_factors = cado_nfs(n)

            # In case cado-nfs returns an empty list, just use sympy's factorint
            if len(cado_factors) == 0:
                factors = factorint(n)
                method_used = 'sympy'
                # DONE, skip to return
            else:
                # Otherwise, find the remaining small factors with sympy's factorint
                remaining = n // product(cado_factors)
                factors = factorint(remaining)

                for f in cado_factors:
                    try:
                        factors[f] += 1
                    except KeyError:
                        factors[f] = 1

                method_used = 'cado'
                # DONE, skip to return
        except:
            # If for whatever reason cado-nfs fails (e.g. if number is too small), just use sympy's factorint
            factors = factorint(n)
            method_used = 'sympy'
            # DONE, skip to return

    return (factors, method_used) if return_method_used else factors
