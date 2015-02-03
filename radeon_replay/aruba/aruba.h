#ifndef __ARUBA_H
#define __ARUBA_H

#include "linux_glue.h"

#include <stdint.h>
#include <stdbool.h>

/* dp_aux.c */
int radeon_read_dpcd(uint8_t bus, uint8_t *dest, uint16_t start, uint16_t len);
int radeon_read_dp_aux_i2c(uint8_t bus, uint8_t addr,
			   uint8_t *dest, uint8_t start, uint16_t len);

/* init_misc.c */
void dynamic_clock_gating_init_hp_1035dx(struct radeon_device *rdev);

/* misc.c */
uint32_t aruba_get_block_offest(uint8_t block_id);
void aruba_powergate_crtc(struct radeon_device *rdev, uint8_t crtc_id,
			  bool enable);
void aruba_scaler_setup(struct radeon_device *rdev, uint8_t crtc_id,
			enum radeon_rmx_type rmx_type);

#endif	/* __ARUBA_H */
