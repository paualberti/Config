/* Copyright 2023 ChuseCubr */
/* https://github.com/ChuseCubr/mini-ryoku */

/* This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>. */

#pragma once

/* One-shot modifiers */
#define OSM_SFT OSM(MOD_LSFT)
#define OSM_CTL OSM(MOD_LCTL)
#define OSM_ALT OSM(MOD_LALT)

#define OSL_MAJ OSL(_MAJ)

/* Mod-Tap */
#define MT_T MT(MOD_LGUI, KC_T)
#define MT_S MT(MOD_LALT, KC_S)

#define MT_N MT(MOD_RGUI, KC_N)
#define MT_A MT(MOD_RALT, KC_A)

/* Layer switching */
#define LT_SPC  LT(_NUM, KC_SPC)

#define TO_HOME TO(_HOME)
#define TO_QWTY TO(_QWTY)

#define OSL_SIM OSL(_SIM)
#define TO_NUM  TO(_NUM)
#define TO_GLOB TO(_GLOB)

#define TG_NUM TG(_NUM)
#define TG_GLOB TG(_GLOB)

/* Extras */
#define ES_EUR ALGR(ES_E)
#define OMEGA ALGR(S(ES_Q))
#define SFT_TAB S(KC_TAB)
