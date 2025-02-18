/* Copyright 2023 ChuseCubr */
/* https://github.com/ChuseCubr/mini-ryoku */

/* This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>. */

#pragma once

/* One-shot modifiers */
#define OSM_SFT OSM(MOD_LSFT)
#define OSM_CTL OSM(MOD_LCTL)
#define OSM_ALT OSM(MOD_LALT)
#define OSM_GUI OSM(MOD_LGUI)

/* Next/prev */
#define WN_NEXT LALT(KC_RGHT)
#define WN_PREV LALT(KC_LEFT)

/* Layer navigation */
#define LT_SPC  LT(_GLOBAL, KC_SPC)
#define TO_HOME TO(_HOME)
#define TO_SYM  TO(_SYM)
#define TO_NUMH  TO(_NUMB)
#define TO_BASE TO(_BASE)
#define OSL_MAJ OSL(_MAJ)
#define TO_SIM  TO(_SIM)
#define TO_NUMB  TO(_NUMB)
#define TO_GLOB TO(_GLOB)
