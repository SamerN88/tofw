import time


def runtime(fxn1, fxn2=None, n=100,
            *,
            args=(), kwargs=(), args1=(), args2=(), kwargs1={}, kwargs2={},
            name1=None, name2=None,
            verbose=True):
    
    vprint = print if verbose else (lambda *_, **__: None)

    if name1 is None:
        try:
            name1 = fxn1.__name__
        except AttributeError:
            name1 = 'fxn1'

    if len(args) > 0:
        args1 = args2 = args

    if len(kwargs) > 0:
        kwargs1 = kwargs2 = kwargs

    vprint(f'({n} iteration{"s" if n > 1 else ""})')

    t1 = time.time()
    for i in range(n):
        fxn1(*args1, **kwargs1)
    runtime1 = time.time() - t1
    vprint(f'{name1}: {runtime1} sec')

    if fxn2 is not None:
        if name2 is None:
            try:
                name2 = fxn2.__name__
            except AttributeError:
                name2 = 'fxn2'

        t2 = time.time()
        for i in range(n):
            fxn2(*args2, **kwargs2)
        runtime2 = time.time() - t2
        vprint(f'{name2}: {runtime2} sec')

    return runtime1 if fxn2 is None else (runtime1, runtime2)
