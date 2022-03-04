#ifndef BWC_CONFIG_H_
#define BWC_CONFIG_H_

#include "cado_config.h"
#include "cado_mpi_config.h"

/* This is the only raison d'être for this file. I couldn't find a way
 * to have linalg/bwc/CMakeLists.txt set something which is reflected in
 * the top-level generated cado_config.h :-(
 */
#define    COOKED_BWC_BACKENDS DO(m128, bucket);DO(m128, basic);DO(m128, sliced);DO(u64k1, bucket);DO(u64k1, basic);DO(u64k1, sliced);DO(u64k2, bucket);DO(u64k2, basic);DO(u64k2, sliced);DO(u64k3, bucket);DO(u64k3, basic);DO(u64k3, sliced);DO(u64k4, bucket);DO(u64k4, basic);DO(u64k4, sliced);DO(p_1, basicp);DO(p_1, zone);DO(p_2, basicp);DO(p_2, zone);DO(p_3, basicp);DO(p_3, zone);DO(p_4, basicp);DO(p_4, zone);DO(p_5, basicp);DO(p_5, zone);DO(p_6, basicp);DO(p_6, zone);DO(p_7, basicp);DO(p_7, zone);DO(p_8, basicp);DO(p_8, zone);DO(p_9, basicp);DO(p_9, zone);DO(p_10, basicp);DO(p_10, zone);DO(p_11, basicp);DO(p_11, zone);DO(p_12, basicp);DO(p_12, zone);DO(p_13, basicp);DO(p_13, zone);DO(p_14, basicp);DO(p_14, zone);DO(p_15, basicp);DO(p_15, zone)

/* #undef BUILD_DYNAMICALLY_LINKABLE_BWC */

#endif	/* BWC_CONFIG_H_ */
