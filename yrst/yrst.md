# Keyboard Configuration

## Ergonomic keyboard layout with vim in mind

Alternative layouts [document](https://docs.google.com/document/d/1Ic-h8UxGe5-Q0bPuYNgE3NoWiI8ekeadvSQ5YysrwII/edit?tab=t.0)<br>
Analysed with [keysolve](https://clemenpine.github.io/keysolve-web/)<br>

```
p l w m q z f o u '
y r s t k j n a e i
g x c d v b h , ; .
```

---

## Get it for yourself

<details><summary>With a generic keyboard</summary>

> [!important]
> This is only a software implementation.<br>
> When another keyboard is attached it will behave the same and any programmable keyboard may behave strangely.

> [!tip]
> Remap CapsLock to Ctrl/Esc.

## What it does

Maintains normal numbers and symbols, Modifies alpha keys, RALT -> BackSpace

File to edit (sudo access is required)

```
sudo vim /usr/share/X11/xkb/symbols/us # or any editor of choice
```

If desired, another file can be edited from the same directory. Just remember that the file name is the language name when setting the layout.

### Look for

```
xkb_symbols "yrst"
```

It is the name of the mapping.

And change it to your preferences

### Layout

<details><summary>Layout Configuration</summary>

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

### Setting the layout

> [!tip]
> This command will activate the layout, prepare the set of your current one just in case.

```
setxkbmap -layout us -variant yrst
```

If you want it to be a permanent layout feel free to change the name yrst for an existing one after solving the repeated layout issue.

</details>

<details><summary>Using qmk with a programmable keyboard</summary>

In the future I will be adding my 34 key layout for the idank/sweeq, a variant of the ferris/sweep, right below.

</details>
