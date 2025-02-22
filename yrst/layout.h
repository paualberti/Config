/* Copyright 2023 ChuseCubr */
/* https://github.com/ChuseCubr/mini-ryoku */

/* This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>. */

#include "keycodes.h"

#pragma once

/* Layout */

#define _HOME_LAYOUT \
/*   ,-------------------------------------------------.    ,-------------------------------------------------.   */\
/*   | P       | L       | W       | M       | Q       |    | Z       | F       | O       | U       | '       |   */\
       ES_P    , ES_L    , ES_W    , ES_M    , ES_Q    ,      ES_Z    , ES_F    , ES_O    , ES_U    , ES_QUOT ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | Y       | R       | S       | T       | K       |    | J       | N       | A       | E       | I       |   */\
       ES_Y    , ES_R    , MT_S    , MT_T    , ES_K    ,      ES_J    , MT_N    , MT_A    , ES_E    , ES_I    ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | Z       | X       | C       | D       | V       |    | K       | H       | ,       | ;       | .       |   */\
       ES_G    , ES_X    , ES_C    , ES_D    , ES_V    ,      ES_B    , ES_H    , ES_COMM , ES_SCLN , ES_DOT  ,     \
/*   `-------------------------------------------------|    |-------------------------------------------------'   */\
/*                                 | SPC     |         |    |         |         |                                 */\
                                     LT_SPC  , OSL_MAJ ,      OSM_CTL , OSL_SIM
/*                                 `-------------------'    `-------------------'                                 */


#define _MAJ_LAYOUT \
/*   ,-------------------------------------------------.    ,-------------------------------------------------.   */\
/*   | P       | L       | W       | M       | Q       |    | Z       | F       | O       | U       | "       |   */\
       S(ES_P) , S(ES_L) , S(ES_W) , S(ES_M) , S(ES_Q) ,      S(ES_Z) , S(ES_F) , S(ES_O) , S(ES_U) , ES_DQUO ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | Y       | R       | S       | T       | K       |    | J       | N       | A       | E       | I       |   */\
       S(ES_Y) , S(ES_R) , S(ES_S) , S(ES_T) , S(ES_K) ,      S(ES_J) , S(ES_N) , S(ES_A) , S(ES_E) , S(ES_I) ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | Z       | X       | C       | D       | V       |    | K       | H       | <       | :       | >       |   */\
       S(ES_G) , S(ES_X) , S(ES_C) , S(ES_D) , S(ES_V) ,      S(ES_B) , S(ES_H) , ES_LABK , ES_COLN , ES_RABK ,     \
/*   `-------------------------------------------------|    |-------------------------------------------------'   */\
/*                                 | SPC     |         |    |         |         |                                 */\
                                     LT_SPC  , OSL_MAJ ,      OSM_CTL , OSL_SIM
/*                                 `-------------------'    `-------------------'                                 */


#define _QWTY_LAYOUT \
/*   ,-------------------------------------------------.    ,-------------------------------------------------.   */\
/*   | Q       | W       | E       | R       | T       |    | Y       | U       | I       | O       | P       |   */\
       ES_Q    , ES_W    , ES_E    , ES_R    , ES_T    ,      ES_Y    , ES_U    , ES_I    , ES_O    , ES_P    ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | A       | S       | D       | F       | G       |    | H       | J       | K       | L       | Ñ       |   */\
       ES_A    , ES_S    , ES_D    , ES_F    , ES_G    ,      ES_H    , ES_J    , ES_K    , ES_L    , ES_NTIL ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | Q       | X       | C       | V       | B       |    | N       | M       | , ;     | . :     | - _     |   */\
       ES_Q    , ES_X    , ES_C    , ES_V    , ES_B    ,      ES_N    , ES_M    , ES_COMM , ES_DOT  , ES_MINS ,     \
/*   `-------------------------------------------------|    |-------------------------------------------------'   */\
/*                                 | SPC     |         |    |         |         |                                 */\
                                     LT_SPC  , OSM_SFT ,      OSM_CTL , OSL_SIM
/*                                 `-------------------'    `-------------------'                                 */


#define _NUM_LAYOUT \
/*   ,-------------------------------------------------.    ,-------------------------------------------------.   */\
/*   | ESC     | ·       | ¿       | ¡       |         |    |         | 7       | 8       | 9       | BSPC    |   */\
       KC_ESC  , ES_BULT , ES_IQUE , ES_IEXL , KC_NO   ,      KC_NO   , KC_7    , KC_8    , KC_9    , KC_BSPC ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | TAB     | ¨       | `       | ´       | €       |    | 0       | 4       | 5       | 6       | ENT     |   */\
       KC_TAB  , ES_DIAE , ES_GRV  , ES_ACUT , ES_EUR  ,      KC_0    , KC_4    , KC_5    , KC_6    , KC_ENT  ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | S-TAB   |         | Ç       | Ñ       |         |    |         | 1       | 2       | 3       | .       |   */\
       SFT_TAB , KC_NO   , ES_CCED , ES_NTIL , KC_NO   ,      KC_NO   , KC_1    , KC_2    , KC_3    , KC_DOT  ,     \
/*   `-------------------------------------------------|    |-------------------------------------------------'   */\
/*                                 |         |         |    |         |         |                                 */\
                                     TO_HOME , OSM_CTL ,      OSM_ALT , OSL_SIM
/*                                 `-------------------'    `-------------------'                                 */


#define _SIM_LAYOUT \
/*   ,-------------------------------------------------.    ,-------------------------------------------------.   */\
/*   | ESC     | @       | #       | $       | %       |    | ^       | &       | *       | Ω       | BSPC    |   */\
       KC_ESC  , ES_AT   , ES_HASH , ES_DLR  , ES_PERC ,      ES_CIRC , ES_AMPR , ES_ASTR , OMEGA   , KC_BSPC ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | TAB     | =       | _       | -       | +       |    | \       | (       | )       | |       | ENT     |   */\
       KC_TAB  , ES_EQL  , ES_UNDS , ES_MINS , ES_PLUS ,      ES_BSLS , ES_LPRN , ES_RPRN , ES_PIPE , KC_ENT  ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | S-TAB   | ?       | /       | !       | ~       |    | [       | {       | }       | ]       |         |   */\
       SFT_TAB , ES_QUES , ES_SLSH , ES_EXLM , ES_TILD ,      ES_LBRC , ES_LCBR , ES_RCBR , ES_RBRC , TO_GLOB ,     \
/*   `-------------------------------------------------|    |-------------------------------------------------'   */\
/*                                 |         |         |    |         |         |                                 */\
                                     TO_HOME , OSM_CTL ,      OSM_ALT , TO_NUM
/*                                 `-------------------'    `-------------------'                                 */


#define _GLOB_LAYOUT \
/*   ,-------------------------------------------------.    ,-------------------------------------------------.   */\
/*   | PSCR    | HOME    | UP      | END     | WBAK    |    | BOOT    | F7      | F8      | F9      | F10     |   */\
       KC_PSCR , KC_HOME , KC_UP   , KC_END  , KC_WBAK ,      QK_BOOT , KC_F7   , KC_F8   , KC_F9   , KC_F10  ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | VOLU    | LEFT    | DOWN    | RGHT    | WFWD    |    |         | F4      | F5      | F6      | F11     |   */\
       KC_VOLU , KC_LEFT , KC_DOWN , KC_RGHT , KC_WFWD ,      TO_HOME , KC_F4   , KC_F5   , KC_F6   , KC_F11  ,     \
/*   |-------------------------------------------------|    |-------------------------------------------------|   */\
/*   | VOLD    | WHLL    | WHLU    | WHLD    | WHLR    |    |         | F1      | F2      | F3      | F12     |   */\
       KC_VOLD , MS_WHLL , MS_WHLU , MS_WHLD , MS_WHLR ,      TO_QWTY , KC_F1   , KC_F2   , KC_F3   , KC_F12  ,     \
/*   `-------------------------------------------------|    |-------------------------------------------------'   */\
/*                                 |         |         |    |         |         |                                 */\
                                     TO_HOME , OSM_CTL ,      OSM_ALT , OSL_SIM
/*                                 `-------------------'    `-------------------'                                 */

