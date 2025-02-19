# Keyboard Configuration

## Ergonomic keyboard layout based on the colemak-qi layout

Alternative layouts [document](https://docs.google.com/document/d/1Ic-h8UxGe5-Q0bPuYNgE3NoWiI8ekeadvSQ5YysrwII/edit?tab=t.0)<br>
Analysed with [keysolve](https://clemenpine.github.io/keysolve-web/)<br>

```
p l w m q z f o u '
y r s t k j n a e i
g x c d v b h , ; .
```

---

## How to use the layout

> [!TIP]
> When using a generic keyboard remap Caps Lock to either Ctrl or Escape.

<details><summary>With a generic keyboard</summary>

### What it does

* Maintains us ansi numbers and symbols
* Modifies alpha keys (letters)
* RALT becomes BackSpace

### What to do

File to edit (sudo access is required)

```
sudo vim /usr/share/X11/xkb/symbols/us
```

If desired, another file can be edited from the same directory. The file name is the language name needed to set the layout.

### Layout

<details><summary>Layout Configuration</summary>

The name of the layout is yrst

```
partial alphanumeric_keys
xkb_symbols "yrst" {

    name[Group1]= "English (yrst-vim)";

    key <TLDE> {	[     grave,	asciitilde	]	};
    key <AE01> {	[	  1,	exclam 		]	};
    key <AE02> {	[	  2,	at		]	};
    key <AE03> {	[	  3,	numbersign	]	};
    key <AE04> {	[	  4,	dollar		]	};
    key <AE05> {	[	  5,	percent		]	};
    key <AE06> {	[	  6,	asciicircum	]	};
    key <AE07> {	[	  7,	ampersand	]	};
    key <AE08> {	[	  8,	asterisk	]	};
    key <AE09> {	[	  9,	parenleft	]	};
    key <AE10> {	[	  0,	parenright	]	};
    key <AE11> {	[     minus,	underscore	]	};
    key <AE12> {	[     equal,	plus		]	};

    key <AD01> {	[	  p,	P 		]	};
    key <AD02> {	[	  l,	L		]	};
    key <AD03> {	[	  w,	W		]	};
    key <AD04> {	[	  m,	M		]	};
    key <AD05> {	[	  q,	Q		]	};
    key <AD06> {	[	  z,	Z		]	};
    key <AD07> {	[	  f,	F		]	};
    key <AD08> {	[	  o,	O		]	};
    key <AD09> {	[	  u,	U		]	};
    key <AD10> {	[ apostrophe,	quotedbl	]	};
    key <AD11> {	[ bracketleft,	braceleft	]	};
    key <AD12> {	[ bracketright,	braceright	]	};

    key <AC01> {	[	  y,	Y 		]	};
    key <AC02> {	[	  r,	R		]	};
    key <AC03> {	[	  s,	S		]	};
    key <AC04> {	[	  t,	T		]	};
    key <AC05> {	[	  k,	K		]	};
    key <AC06> {	[	  j,	J		]	};
    key <AC07> {	[	  n,	N		]	};
    key <AC08> {	[	  a,	A		]	};
    key <AC09> {	[	  e,	E		]	};
    key <AC10> {	[ 	  i,	I    		]	};
    key <AC11> {	[     slash,	question	]	};

    key <AB01> {	[	  g,	G 		]	};
    key <AB02> {	[	  x,	X		]	};
    key <AB03> {	[	  c,	C		]	};
    key <AB04> {	[	  d,	D		]	};
    key <AB05> {	[	  v,	V		]	};
    key <AB06> {	[	  b,	B		]	};
    key <AB07> {	[	  h,	H		]	};
    key <AB08> {	[     comma,	less		]	};
    key <AB09> {	[ semicolon,	colon		]	};
    key <AB10> {	[    period,	greater		]	};

    key <BKSL> {	[ backslash,    bar		]	};
    key <RALT> {	[ BackSpace,	BackSpace	]	};
};
```
</details>

### Activate the layout

```
setxkbmap -layout us -variant yrst
```

#### To make it a default in your system

1 Change the name from yrst to an existing one, i.e "colemak".
2 Select that layout from within the settings gui.
3 Restart the session, restart or logout and login.

</details>

<details><summary>Using qmk with a programmable keyboard</summary>

### Set the qmk environment

```
sudo apt install -y git python3-pip
python3 -m pip install --user qmk
echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && source $HOME/.bashrc
qmk setup
qmk config user.keyboard=idank/sweeq
qmk config user.keymap=yrst
qmk new-keymap
qmk compile -e CONVERT_TO=rp2040_ce
```

### Copy the keymap into the corresponding folder

```
cp -r $HOME/Config/yrst/ $HOME/qmk_firmware/keyboards/idank/sweeq/keymaps/
```

This keymap is by default expecting a computer set to spanish. The only file that needs to be changed if language is set to english is 'keymap.c'

</details>
