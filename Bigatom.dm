/******************************************************************
BigAtom by Shadowdarke (shadowdarke@hotmail.com) April 2006
bigatom_icon_height(), bigatom_icon_width(), and bigatom_IsEditorPlaced() procs by Deadron.

The BigAtom Library provides a simple yet flexible system to make and control atoms larger than
a single 32x32 tile, using the new new large icon format in BYOND 4.0. BigAtom was designed to
fit easily into your projects with minimal work on your part.

There will be a series of articles published through the Dream Makers BYOND guild. Be sure to
look for them at
http://members.byond.com/DreamMakers?command=view_keyword_posts&keyword=bigatom.

"Go Big in Existing Games" will be the first in the series and describes how to use BigAtom to
	add multi-tile atoms to existing projects.


===================================================================
BIGATOM REFERENCE:

BigAtom provides a few extra vars and procs to movable atoms to track and control it as a
bigatom. These will be explained in detail here.

-------------------------------------------------------------------
Proc Overrides:

BigAtom overrides atom/movable/New() to automatically build a bigatom if the atom has an icon and
icon_state that is larger than 32x32, and the atom's bigatom_mode var is not equal to
BIGATOM_OFF (0).

It also overrides atom/movable/Move() to handle movement correctly for bigatoms.

Finally, BigAtom overides atom/movable/Del() to automatically delete all parts when the source
is deleted.

-------------------------------------------------------------------
Global Procs: The library provides the following global procs for your use.

proc/bigatom_flick(display, atom)
	BigAtom version of flick(). Note that bigatom_flick() does not work with overlay mode.

proc/bigatom_get_dist(atom/A, atom/B)
	Returns the distance between the nearest edges of A and B. This may be inaccurate if
	either atom uses the BIGATOM_PRESERVE_PARTS flag.

proc/bigatom_ValidTarget(atom/target, atom/relative_to = usr, range = 1, \
	flags = BIGATOM_TARGET_NOT_SELF)
	This proc is used to get and verify the correct target for verbs and other actions, since
	verb src settings and some other methods of target verification don't work well with
	BigAtoms.
	ARGS:
		target			the atom to be verified.
		relative_to		the atom relative to which the target will be verified.
						DEFAULT: usr
		range			minimum range allowed between the edges of relative_to atom and target.
						If range < 0 then range is not verified.
						DEFAULT: 1
		flags			Optional flags for target validation.
						BIGATOM_TARGET_NOT_SELF	if this flag is set, then do not allow an atom
												to target itself.
						DEFAULT: BIGATOM_TARGET_NOT_SELF
	RETURNS: The correct target, or null if the target is invalid.

proc/icon_height(icon, icon_state)
	Given an icon and icon_state, determine how many tiles high it is.

proc/icon_width(icon, icon_state)
	Given an icon and icon_state, determine how many tiles wide it is.

proc/bigatom_step_away(atom/movable/Ref, Trg, Max = 5)
	BigAtom version of step_away()
proc/bigatom_step_rand(atom/movable/Ref)
	BigAtom version of step_rand()
proc/bigatom_step_to(atom/movable/Ref, Trg, Min = 0)
	BigAtom version of step_to()
proc/bigatom_step_towards(atom/movable/Ref, Trg)
	BigAtom version of step_towards()
proc/bigatom_walk(atom/movable/Ref, Dir, Lag = 0)
	BigAtom version of walk()
proc/bigatom_walk_away(atom/movable/Ref, Trg, Max = 5, Lag = 0)
	BigAtom version of walk_away()
proc/bigatom_walk_rand(atom/movable/Ref, Lag = 0)
	BigAtom version of walk_rand()
proc/bigatom_walk_to(atom/movable/Ref, Trg, Min = 0, Lag = 0)
	BigAtom version of walk_to()
proc/bigatom_walk_towards(atom/movable/Ref, Trg, Lag = 0)
	BigAtom version of walk_towards()

-------------------------------------------------------------------
Movable Atom Vars: The library adds these vars to movable atoms.

	bigatom_mode	- This var controls how the BigAtom library interacts with the atom. It is
		a series of bitflags, so you may combine modes with the OR (|) operator. For example:
			bigatom_mode = BIGATOM_PRESERVEPARTS | BIGATOM_NOOVERLAYS
		specifies to preserve the parts list and not use overlay mode.

		Flags:
			BIGATOM_OFF				- Don't use BigAtom for this atom. Setting any flag turns
										BigAtom on.
			BIGATOM_ON				- Use BigAtom if appropriate for icon, BigAtom is on if
										any flag is set, this is just provided so you can turn
										it on with all default flags.
			BIGATOM_NOOVERLAYS		- Don't use overlays mode. This flag is automatically
										set whenever an image larger than 192 x 192 is set to
										the bigatom.
			BIGATOM_MAYMOVENULL		- The bigatom's parts may move off the edge of the map.
										Even with this set, moving the source of the bigatom off
										the map results in every part moving off the map.
			BIGATOM_PRESERVEPARTS	- Preserve the parts list when the image resizes,
										growing as needed. Parts outside of the icon will be blank
										but present.
			BIGATOM_REGENERATEPARTS - Signals the bigatom_Icon() proc to regenerate the
										parts list.
			The following BIGATOM_PARTS_... flags decrease the number of atoms created for each
				BigAtom, saving resources and improving overall performance. There is a tradeoff
				though, as collision and targetting detection may not be completely accurate.
			BIGATOM_PARTS_... flags only work in overlay mode. If BIGATOM_NOOVERLAYS is set
				(manually or automatically by using an oversized icon) these flags have no effect.
			BIGATOM_PARTS_NONE		- No parts generated. Overrides all other BIGATOM_PARTS_ flags.
			BIGATOM_PARTS_CORNERS	- Generate parts at the four corners
			BIGATOM_PARTS_NORTH		- Generate parts at the north edge
			BIGATOM_PARTS_SOUTH		- Generate parts at the south edge
			BIGATOM_PARTS_EAST		- Generate parts at the east edge
			BIGATOM_PARTS_WEST		- Generate parts at the west edge
			BIGATOM_PARTS_EDGES		- Generate all edges

	bigatom_x = 0	-  relative position of this part in the big icon
	bigatom_y = 0

	atom/movable/bigatom_src	- The source or "head" of the big atom that tracks the rest of
		the bigatom's parts.

These vars are only valid for the source of the bigatom. They are ignored on bigatom sub-parts
	bigatom_width = 0	- automatically set to the current width (in tiles)
	bigatom_height = 0	- automatically set to the current height (in tiles)

	bigatom_left				// left edge of the bigatom
	bigatom_bottom				// bottom edge of the bigatom

	bigatom_layer	- Used to preserve the layer if using layer_shifting
	bigatom_layer_shift_y	- Shift layer by this amount times vertical offset. You may use
		this var to make higher parts display on a higher layer. This effect is usually used to
		represent tall atoms.

	list/bigatom_parts	- list of all subparts of the big atom
	list/bigatom_partoverlays	- list of all subpart overlays on the big atom, if it is in
		overlay mode

-------------------------------------------------------------------
Movable Atom Procs: The library adds these procs to movable atoms. There are several additional
	procs that aren't essential to the library in BigAtomUtilities.dm.

bigatom_BumpCheck(turf/T)
	Checks T and that atoms within it to see what blocked movement, then calls Bump() on the
	blockage. Override this is you want to customize how Bump() is triggered.

bigatom_DelParts()
	Delete each part and the parts list. Called automatically by Del()

bigatom_Icon()
	Display the current icon and state, building and expanding sub-parts as needed. This is
	called automatically in New(), if bigatom_mode is any value other than BIGATOM_OFF. It is
	called automatically by bigatom_Var() if it changes a var that alters the display.

bigatom_Overlay()
	Apply overlays/underlays to the big atom.

bigatom_Part(X,Y)
	Returns the part at offset X,Y relative to the source (which should be the center of the
	bigatom.) Use this proc to manipulate specific parts of the bigatom.

bigatom_Resized()
	Called automatically when the display is resized. This proc is a stub provided so that you
	may react to a size change.

bigatom_StatePrefix()
	Returns the prefix for the icon_state, if the icon_state is in "[prefix] [X],[Y]" or
	"[X],[Y]" format. Otherwise, it returns the icon_state.

bigatom_Var(var_name, new_value)
	Set the specified var to new_value for every part. May automatically call bigatom_Icon() if
	the display is altered.

bigatom_X()
	The X location for this part, taking into account any offset amount for centering the
	head object. You can override this to change how the offset is handled.

bigatom_Y()
	The Y location for this part, taking into account any offset amount for centering the
	head object. You can override this to change how the offset is handled.

bigatom_Layer(X,Y)
	Returns the layer to use for the part at this location. Provided so you can customize
	your layer handling, if you wish.

bigatom_Density(X,Y)
	Returns the density to use for the part at this location. Provided so you can customize
	your density handling, if you wish.

bigatom_SetDensity()
	Sets the density of each part. Provided to centralize the behavior internally; you don't
	really need to override this.

bigatom_IsEditorPlaced()
	Attempts to determine if this object was placed in the map editor.  Used for internal
	purposes.

******************************************************************/

// bigatom_mode flags
#define BIGATOM_OFF				0
#define BIGATOM_ON				1
#define BIGATOM_NOOVERLAYS		2
#define BIGATOM_MAYMOVENULL		4
#define BIGATOM_PRESERVEPARTS	8
#define BIGATOM_REGENERATEPARTS	16
#define BIGATOM_PARTS_CORNERS	512
#define BIGATOM_PARTS_NORTH		1024
#define BIGATOM_PARTS_SOUTH		2048
#define BIGATOM_PARTS_EAST		4096
#define BIGATOM_PARTS_WEST		8192
#define BIGATOM_PARTS_NONE		16384
#define BIGATOM_PARTS_EDGES		(BIGATOM_PARTS_NORTH | BIGATOM_PARTS_SOUTH | BIGATOM_PARTS_EAST | BIGATOM_PARTS_WEST)
#define BIGATOM_PARTS_FLAGS		(BIGATOM_PARTS_CORNERS | BIGATOM_PARTS_EDGES)

// bigatom Overlay flags
#define BIGATOM_UNDERLAYS		1

// targetting flags
#define BIGATOM_TARGET_NOT_SELF	1

// walk modes
#define BIGATOM_WALK_NONE	0
#define BIGATOM_WALK_AWAY	1
#define BIGATOM_WALK_DIR	2
#define BIGATOM_WALK_RAND	4
#define BIGATOM_WALK_TO		8
#define BIGATOM_WALK_TOWARD	16

/* For the given height or width, calculate the offset for the object head.
   Don't let the offset exceed the width/height of the object. */
#define BIGATOM_OFFSETAMOUNT(X) (min(round(X/2, 1)-1, X-1))

var/bigatom_building = 0

atom/movable
	var
		bigatom_mode = BIGATOM_OFF	/* set to BIGATOM_OFF to disable automatic bigatom
										generation. Set to BIGATOM_NOOVERLAYS to force
										bigatom to use "no overlay" mode. No overlay mode
										is automatically set if the icon is larger than
										192x192. */
		bigatom_part_type			/* if parts should be of another type, specify that type
									    here. This can simplify your type checking; for example,
									    by only having the actual player be a mob and their
									    parts being a special obj type. */
		bigatom_x = 0				// relative position of this part in the big icon
		bigatom_y = 0
		bigatom_width = 0			// automatically set to the current width (in tiles)
		bigatom_height = 0			// automatically set to the current height (in tiles)
		bigatom_left = 0			// left edge of the bigatom
		bigatom_bottom = 0			// bottom edge of the bigatom
		bigatom_layer				// preserve the layer if using layer_shifting
		bigatom_layer_shift_y		// shift layer by this amount times vertical offset
		bigatom_density				// preserve the density if using density height.
		bigatom_density_height = -1	/* make dense if this part is this relative height or lower;
										-1 means that this is not used and density is based on
										whether base object is dense or not. */
		atom/movable/bigatom_src	// The "head" or "source" of the big atom
		bigatom_walkmode			// determines away, rand, to, or toward
		bigatom_walklag				// ticks between steps
		bigatom_walktarget			// target walking to or away from
		bigatom_walkdistance		// the min or max distance to target (away/to modes)
		list
			bigatom_parts			// list of all subparts of the big atom
			bigatom_partoverlays	// list of all subpart overlays on the big atom

	proc
		bigatom_attempt_step(list/test_dirs)
			/* try to step each direction in test_dirs in order
				RETURNS: 1 if it could step one of those directions, or 0 if not able to.
			*/
			var
				list/oldlocs = list()
				atom/movable/M
				Dir = 0
				pos = 0
				turf/T

			// move off the map temporarily to test movement
			for(M in bigatom_parts + src)
				oldlocs[M] = M.loc
				M.loc = null

			while(++pos<test_dirs.len && !Dir)
				Dir = test_dirs[pos]
				for(M in bigatom_parts + src)
					M.loc = oldlocs[M]	// in case turf Enter() checks locality
					T = get_step(M, Dir)
					if(!T)
						if(!(bigatom_mode&BIGATOM_MAYMOVENULL))
							Dir = 0
					else if(!T.Enter(M))
						Dir = 0
					M.loc = null

			for(M in bigatom_parts + src)
				M.loc = oldlocs[M]
				if(Dir)
					T = get_step(M, Dir)
					M.Move(T, Dir)
			if(Dir) return 1
			else return 0

		bigatom_BumpCheck(turf/T)
			// src was blocked at T. Bump() the appropriate blocking atom.
			if(density && istype(T))
				if(T.density) Bump(T)
				else	// search for dense blockage
					for(var/atom/movable/M in T)
						if(M.density)
							Bump(M)
							return

		bigatom_DelParts()
			// delete each part and the parts list
			if(bigatom_partoverlays)
				overlays -= bigatom_partoverlays
				del(bigatom_partoverlays)
			if(bigatom_parts)
				for(var/atom/movable/M in bigatom_parts)
/*
					if(!(bigatom_mode & BIGATOM_NOOVERLAYS))
						M.icon = icon
						overlays -= M
*/
					del(M)
				del(bigatom_parts)

		bigatom_Icon()
			// Display the current icon and state, building sub parts if needed
			var/first_display = !bigatom_width && bigatom_IsEditorPlaced()
			var/state_prefix = ""
			if(icon_state)
				state_prefix = bigatom_StatePrefix()

			if(isnull(bigatom_layer)) bigatom_layer = layer
			if(isnull(bigatom_density)) bigatom_density = density

			// state_prefix because icon_state will not work if this is editor-placed.
			var/height = bigatom_icon_height(icon, state_prefix)
			var/width = bigatom_icon_width(icon, state_prefix)

			if(height > 1 || width > 1)	// multi-part icon
				if(state_prefix) state_prefix += " "
				if((width > 7) || (height > 7))	// too large for overlay mode
					bigatom_mode |= BIGATOM_NOOVERLAYS

				// center the head
				var/offsetx = BIGATOM_OFFSETAMOUNT(width)
				var/offsety = BIGATOM_OFFSETAMOUNT(height)
				bigatom_src = src

				// build the parts list
				if((bigatom_mode & BIGATOM_REGENERATEPARTS) || (bigatom_width != width) || \
					(bigatom_height != height))
					if(!(bigatom_mode & BIGATOM_NOOVERLAYS) && bigatom_mode & BIGATOM_PARTS_NONE)
						if(bigatom_parts) bigatom_DelParts()
						bigatom_width = width
						bigatom_height = height
						bigatom_left = -offsetx
						bigatom_bottom = -offsety
					else
						var/list/made = list("[bigatom_x],[bigatom_y]")
						if((bigatom_mode & BIGATOM_PRESERVEPARTS) && bigatom_parts)
							for(var/atom/movable/M in bigatom_parts)
								made += "[M.bigatom_x],[M.bigatom_y]"
							if(bigatom_width < width) bigatom_width = width
							if(bigatom_height < height) bigatom_height = height
							if(bigatom_left > -offsetx) bigatom_left = -offsetx
							if(bigatom_bottom > -offsety) bigatom_bottom = -offsety
						else // delete the parts list
							bigatom_DelParts()
							bigatom_parts = list()
							bigatom_width = width
							bigatom_height = height
							bigatom_left = -offsetx
							bigatom_bottom = -offsety
						bigatom_building = bigatom_mode
						// add parts as needed
						var
							part_type = bigatom_part_type || type
							part_flags = 0
							loy = 0-offsety
							hiy = (height-1)-offsety
							lox = 0-offsetx
							hix = (width-1)-offsetx
						if(!(bigatom_mode & BIGATOM_NOOVERLAYS))
							part_flags = bigatom_mode & BIGATOM_PARTS_FLAGS
						for(var/Y = loy to hiy)
							for(var/X = lox to hix)
								if(part_flags) // only building specific parts
									var/make_part = 0
									if((part_flags & BIGATOM_PARTS_NORTH) && (Y == hiy))
										make_part = 1
									else if((part_flags & BIGATOM_PARTS_SOUTH) && (Y == loy))
										make_part = 1
									else if((part_flags & BIGATOM_PARTS_EAST) && (X == hix))
										make_part = 1
									else if((part_flags & BIGATOM_PARTS_WEST) && (X == lox))
										make_part = 1
									else if(part_flags & BIGATOM_PARTS_CORNERS && \
									(Y == loy || Y == hiy) && (X == lox || X == hix))
										make_part = 1
									if(!make_part) continue

								var/pos = "[X],[Y]"
								if(pos in made) continue

								var/atom/movable/M = new part_type()
								M.bigatom_x = X
								M.bigatom_y = Y
								M.bigatom_src = src
								M.name = name
								M.invisibility = invisibility
								bigatom_parts += M
						bigatom_building = 0
					bigatom_Resized()


				// clear old part overlays
				overlays -= bigatom_partoverlays
				del(bigatom_partoverlays)

				if(bigatom_mode&BIGATOM_NOOVERLAYS)	// no overlay mode
					for(var/atom/movable/M in bigatom_parts)
						M.name = name
						M.text = text
						var/checkx = M.bigatom_X()
						var/checky = M.bigatom_Y()
						if((checkx >= 0) && (checkx <= width) && (checky >= 0) && (checky <= height))
							M.icon = icon
						else
							M.icon = null
						M.icon_state = "[state_prefix][checkx],[checky]"
						M.layer = bigatom_Layer(checkx, checky)
				else	// overlay mode
					bigatom_partoverlays = list()
					for(var/Y = 0 to height-1)
						for(var/X = 0 to width-1)
							if(Y == offsety && X == offsetx) continue
							var/image/I = image(icon,src,"[state_prefix][X],[Y]",bigatom_Layer(X, Y))
							I.pixel_x = (X - offsetx) * 32
							I.pixel_y = (Y - offsety) * 32
							bigatom_partoverlays += I
							overlays += I

				icon_state = "[state_prefix][bigatom_x+offsetx],[bigatom_y+offsety]"
				layer = bigatom_Layer(bigatom_X(), bigatom_Y())

				bigatom_SetDensity()

				// Place objects using Move().
				if(bigatom_parts || first_display)
					var/destination = first_display ? locate(x + offsetx, y + offsety, z) : loc
					Move(destination, dir)

			else	// not multi-part, delete any existing parts
				bigatom_src = null
				bigatom_width = 1
				bigatom_height = 1
				bigatom_left = 0
				bigatom_bottom = 0
				icon_state = state_prefix
				if(bigatom_mode & BIGATOM_PRESERVEPARTS)
					for(var/atom/movable/M in bigatom_parts)
						M.icon = null
				else
					bigatom_DelParts()


		bigatom_StatePrefix()
			// returns the base of the icon_state, sans " [X],[Y]" at the end
			var
				pos = length(icon_state)
				comma = 0
				n1 = 0
				n2 = 0
			while(pos>0)
				switch(text2ascii(icon_state,pos))
					if(32)	//
						if(n1 && n2)	// has both number parts
							return copytext(icon_state, 1, pos)
						else	// wrong format
							return icon_state
					if(44)			// a comma
						if(comma) // already have one. Abort
							return icon_state
						else
							comma = pos
					if(48 to 57)	// a number
						if(comma)
							n1 = pos
						else
							n2 = pos
					else			// anything else
						return icon_state // not "[base] [X],[Y]" format
				--pos
			// there was no space
			if(n1 && n2)	// "[X],[Y]" with no base state
				return ""
			else	// not the right format
				return icon_state

		bigatom_X()
			// Offset location for this object. Centralizes this and allows for overriding.
			return bigatom_x + BIGATOM_OFFSETAMOUNT(bigatom_src.bigatom_width)

		bigatom_Y()
			// Offset location for this object. Centralizes this and allows for overriding.
			return bigatom_y + BIGATOM_OFFSETAMOUNT(bigatom_src.bigatom_height)

		bigatom_Layer(X,Y)
			var/newlayer = bigatom_src.bigatom_layer + bigatom_src.bigatom_layer_shift_y * Y
			return newlayer

		bigatom_SetDensity()
			// Sets density for all parts.
			if (bigatom_src != src) return bigatom_src.bigatom_SetDensity()
			density = bigatom_Density(bigatom_X(), bigatom_Y())
			for(var/atom/movable/M in bigatom_parts)
				M.density = bigatom_Density(M.bigatom_X(), M.bigatom_Y())

		bigatom_Density(X,Y)
			// Indicate what density this part should have.
			if (bigatom_src.bigatom_density_height > -1)
				if (Y <= bigatom_src.bigatom_density_height)
					return 1
				else
					return 0
			else
				return bigatom_src.bigatom_density

		bigatom_Overlay(overlay, options)
			/* Adds an overlay (or underlay) to the bigatom
				ARGS:
					overlay	- the overlay to add to
					options	- Options flags:
								BIGATOM_UNDERLAYS	- use the underlays list rather than the overlays list
			*/
			if(bigatom_src != src)	// check with the head
				return bigatom_src.bigatom_Overlay(overlay, options)

			if(options & BIGATOM_UNDERLAYS)
				underlays += overlay
				for(var/atom/movable/M in bigatom_parts)
					M.underlays += overlay
			else
				overlays += overlay
				for(var/atom/movable/M in bigatom_parts)
					M.overlays += overlay

		bigatom_Part(X,Y)
			// return the part at offset X,Y
			if((X == bigatom_x) && (Y == bigatom_y)) return src
			if(bigatom_src != src)	// check with the head
				return bigatom_src.bigatom_Part(X,Y)
			if(bigatom_parts)
				for(var/atom/movable/M in bigatom_parts)
					if((X == M.bigatom_x) && (Y == M.bigatom_y)) return M

		bigatom_Resized()
			// called automatically when the display is resized.

		bigatom_Var(var_name, new_value)
			// set the specified var to new_value for every part
			src.vars[var_name] = new_value

			if(bigatom_src && bigatom_src != src)	// this is a big atom part, but not the head
				bigatom_src.bigatom_Var(var_name, new_value)	// let the head handle things
				return

			switch(var_name)
				if("icon","icon_state")
					bigatom_Icon()
				if("screen_loc")
					// TODO:
				if("layer")
					bigatom_layer = new_value
					bigatom_Icon()
				if("density")
					bigatom_density = new_value
					bigatom_SetDensity()
				else
					for(var/atom/movable/M in bigatom_parts)
						M.vars[var_name] = new_value

		bigatom_IsEditorPlaced()
			// We assume that if the tag contains the icon state, the map editor placed this.
			// For example, if icon_state is "0,0", tag will be "icon-0,0".
			if (icon_state && findtext(tag, icon_state))
				return 1

		bigatom_walkloop()	//handles walking
			while(bigatom_walkmode)
				switch(bigatom_walkmode)
					if(BIGATOM_WALK_AWAY)
						bigatom_step_away(src, bigatom_walktarget, bigatom_walkdistance)
					if(BIGATOM_WALK_DIR)
						step(src, bigatom_walktarget)
					if(BIGATOM_WALK_RAND)
						bigatom_step_rand(src)
					if(BIGATOM_WALK_TO)
						bigatom_step_to(src, bigatom_walktarget, bigatom_walkdistance)
					if(BIGATOM_WALK_TOWARD)
						bigatom_step_towards(src, bigatom_walktarget)
				sleep(bigatom_walklag)

	Del()
		bigatom_DelParts()
		..()

	Move(turf/NewLoc,Dir=0)
		if(!bigatom_parts)
			return ..()

		if(isturf(NewLoc))
			// move off the map temporarily to test movement
			var/list/oldlocs = list()
			var/atom/movable/M
			for(M in bigatom_parts + src)
				oldlocs[M] = M.loc
				M.loc = null

			var/may_move = 1
			var/bumped = null
			var/atom/movable/bumper = null
			for(M in bigatom_parts + src)
				var/turf/T = locate(NewLoc.x + M.bigatom_x, NewLoc.y + M.bigatom_y, NewLoc.z)
				M.loc = oldlocs[M]	// in case turf Enter() checks locality
				if(!T)
					if(bigatom_mode&BIGATOM_MAYMOVENULL)
						M.loc = null
						continue
					else
						may_move = 0
						break
				if(!T.Enter(M))
					may_move = 0
					bumped = T
					bumper = M
					break
				M.loc = null

			for(M in bigatom_parts)
				M.loc = oldlocs[M]
				if(may_move)
					var/turf/T = locate(NewLoc.x + M.bigatom_x, NewLoc.y + M.bigatom_y, NewLoc.z)
					M.Move(T, Dir)
			loc = oldlocs[src]
			if(may_move)
				. = ..()
/*
				if(.)
					var/state_suffix = "[bigatom_x],[bigatom_y]"
					if(!icon_state)
						icon_state = state_suffix
					else
						state_suffix = " [state_suffix]"
						var/pos = length(icon_state)-length(state_suffix) + 1
						if(pos>0 && (copytext(icon_state, pos) != state_suffix))
							icon_state = "[icon_state][state_suffix]"
*/
				if(!.)	// movement was blocked for src
					bigatom_BumpCheck(NewLoc)
			else	// movement was blocked for one of the Parts
				if(istype(bumper)) bumper.bigatom_BumpCheck(bumped)
		else	// not moving on the map
			. = ..()
/*
			if(.)
				// switch to the 32x32 mini-icon and move all parts to null
				var/state_suffix = "[bigatom_x],[bigatom_y]"
				if(icon_state==state_suffix)
					icon_state = ""
				else
					state_suffix = " [state_suffix]"
					var/pos = length(icon_state)-length(state_suffix) + 1
					if(pos>0 && pos<length(icon_state) && (copytext(icon_state, pos) == \
						state_suffix))
						icon_state = copytext(icon_state,1, pos)
				for(var/atom/movable/M in bigatom_parts + src)
					M.loc = null
*/
	New(Loc)
		..()
		if(bigatom_mode)
			if(bigatom_building)
				if(bigatom_building & BIGATOM_NOOVERLAYS)
					animate_movement = SYNC_STEPS
				else	// overlay mode doesn't use parts for display, null the icon
					icon = null
			else
				// The map editor places sub-pieces for large objects, but we want to replace that
				// with our own behavior.  So unless it's the 0,0 object of a large icon, delete it.
				if(bigatom_IsEditorPlaced() && !findtext(icon_state,"0,0") && findtext(icon_state,","))
					del(src)
				else
					bigatom_Icon()

/*************
 Global Procs
*************/
proc/bigatom_flick(display, atom/movable/A)
	// calls flick() for each part of the bigatom.
	if(!(istype(A) && A.bigatom_src))
		flick(display, A)
		return
	A = A.bigatom_src
	var/prefix
	var/is_state
	if(istext(display))
		is_state = 1
		prefix = display
		if(display) prefix += " "
	for(var/atom/movable/M in A.bigatom_parts + A)
		if(is_state)
//					world << "[prefix][M.bigatom_x-bigatom_left],[M.bigatom_y-bigatom_bottom]"
			flick("[prefix][M.bigatom_x-A.bigatom_left],[M.bigatom_y-A.bigatom_bottom]", M)
		else
			flick(display, M)


proc/bigatom_get_dist(atom/A, atom/B)
	/* Returns the distance between the nearest edges of A and B.
		This may be inaccurate if either atom uses the BIGATOM_PRESERVE_PARTS flag. */
	if(!(istype(A) && istype(B))) return
	var
		ax_lo = A.x
		ax_hi = A.x
		ay_lo = A.y
		ay_hi = A.y
		bx_lo = B.x
		bx_hi = B.x
		by_lo = B.y
		by_hi = B.y
		atom/movable/C = A
	if(istype(C) && C.bigatom_src)
		C = C.bigatom_src
		ax_lo = C.x - C.bigatom_x + C.bigatom_left
		ax_hi = ax_lo + C.bigatom_width - 1
		ay_lo = C.y - C.bigatom_y + C.bigatom_bottom
		ay_hi = ay_lo + C.bigatom_height - 1
	C = B
	if(istype(C) && C.bigatom_src)
		C = C.bigatom_src
		bx_lo = C.x - C.bigatom_x + C.bigatom_left
		bx_hi = bx_lo + C.bigatom_width - 1
		by_lo = C.y - C.bigatom_y + C.bigatom_bottom
		by_hi = by_lo + C.bigatom_height - 1
	return max(0,bx_lo - ax_hi, ax_lo - bx_hi, by_lo - ay_hi, ay_lo - by_hi)

proc/bigatom_ValidTarget(atom/target, atom/relative_to = usr, range = 1, \
	flags = BIGATOM_TARGET_NOT_SELF)
	/* This proc is used to get and verify the correct target for verbs and other actions, since
		verb src settings and some other methods of target verification don't work well with
		BigAtoms.
	ARGS:
		target			the atom to be verified.
		relative_to		the atom relative to which the target will be verified.
						DEFAULT: usr
		range			minimum range allowed between the edges of relative_to atom and target.
						If range < 0 then range is not verified.
						DEFAULT: 1
		flags			Optional flags for target validation.
						BIGATOM_TARGET_NOT_SELF	if this flag is set, then do not allow an atom
												to target itself.
						DEFAULT: BIGATOM_TARGET_NOT_SELF
	RETURNS: The correct target, or null if the target is invalid.
	*/
	var/atom/movable/mov = target
	if(istype(mov) && mov.bigatom_src && mov.bigatom_src!=target)
		target = mov.bigatom_src	// use the source of a BigAtom
	if((flags & BIGATOM_TARGET_NOT_SELF) && (target == relative_to)) return
	if((range>=0) && (bigatom_get_dist(target,relative_to) > range)) return
	return target


proc/bigatom_icon_height(icon, icon_state)
	/* Given an icon and icon_state, determine how many tiles high it is.

	   Multi-tiled icons are broken up into icon states described by their coordinates, such as
	   "0,0". So we look for the highest Y coordinate we can find. */
	if (!icon) return 0

	var/list/states = icon_states(icon)
	if(icon_state) icon_state += " "

	// Is this multi-tile at all? If so must have 0,0 coordinate.
	if (!states.Find("[icon_state]0,0"))
		// Not multi-tiled, must be just one tile high.
		return 1

	// Okay what's the highest Y value we can find?
	// Since coordinates are zero-based, have to return 1 higher than what we find.
	var/Y = 0
	while(1)
		Y++
		if (!states.Find("[icon_state]0,[Y]"))
			return Y

proc/bigatom_icon_width(icon, icon_state)
	/* Given an icon and icon_state, determine how many tiles wide it is.

	   Multi-tiled icons are broken up into icon states described by their coordinates, such as
	   "0,0". So we look for the highest X coordinate we can find. */
	if (!icon) return 0

	var/list/states = icon_states(icon)
	if(icon_state) icon_state += " "

	// Is this multi-tile at all? If so must have 0,0 coordinate.
	if (!states.Find("[icon_state]0,0"))
		// Not multi-tiled, must be just one tile high.
		return 1

	// Okay what's the highest X value we can find?
	// Since coordinates are zero-based, have to return 1 higher than what we find.
	var/X = 0
	while(1)
		X++
		if (!states.Find("[icon_state][X],0"))
			return X

proc/bigatom_step_away(atom/movable/Ref, Trg, Max = 5)
	// BigAtom version of step_away()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	if(!Ref.bigatom_parts)
		return step_away(Ref, Trg, Max)
	if(bigatom_get_dist(Ref, Trg) >= Max) return 0
	var
		Dir = get_dir(Trg, Ref)
		list/test_dirs = list(Dir, turn(Dir, 45), turn(Dir, -45), turn(Dir, 90), turn(Dir, -90))
	return Ref.bigatom_attempt_step(test_dirs)

proc/bigatom_step_rand(atom/movable/Ref)
	// BigAtom version of step_rand()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	if(!Ref.bigatom_parts)
		return step_rand(Ref)
	var
		list/dirs = list(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
		list/test_dirs = list()
		D
	if(prob(90))
		test_dirs += Ref.dir
		dirs -= Ref.dir
	while(dirs.len)
		D = pick(dirs)
		dirs -= D
		test_dirs += D
	return Ref.bigatom_attempt_step(test_dirs)

proc/bigatom_step_to(atom/movable/Ref, Trg, Min = 0)
	// BigAtom version of step_to()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	if(!Ref.bigatom_parts)
		return step_to(Ref, Trg, Min)
	if(bigatom_get_dist(Ref, Trg) <= Min) return 0
	var
		Dir = get_dir(Ref, Trg)
		list/test_dirs = list(Dir, turn(Dir, 45), turn(Dir, -45), turn(Dir, 90), turn(Dir, -90))
	return Ref.bigatom_attempt_step(test_dirs)

proc/bigatom_step_towards(atom/movable/Ref, Trg)
	// BigAtom version of step_towards()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	if(!Ref.bigatom_parts)
		return step_towards(Ref, Trg)
	var
		Dir = get_dir(Ref, Trg)
		list/test_dirs = list(Dir, turn(Dir, 45), turn(Dir, -45), turn(Dir, 90), turn(Dir, -90))
	return Ref.bigatom_attempt_step(test_dirs)

proc/bigatom_walk(atom/movable/Ref, Dir, Lag = 0)
	// BigAtom version of walk()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	if(!Dir)
		Ref.bigatom_walkmode = BIGATOM_WALK_NONE
	else
		var/start_loop = !Ref.bigatom_walkmode
		Ref.bigatom_walkmode = BIGATOM_WALK_DIR
		Ref.bigatom_walktarget = Dir
		Ref.bigatom_walklag = Lag
		if(start_loop) Ref.bigatom_walkloop()

proc/bigatom_walk_away(atom/movable/Ref, Trg, Max = 5, Lag = 0)
	// BigAtom version of walk_away()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	var/start_loop = !Ref.bigatom_walkmode
	Ref.bigatom_walkmode = BIGATOM_WALK_AWAY
	Ref.bigatom_walktarget = Trg
	Ref.bigatom_walkdistance = Max
	Ref.bigatom_walklag = Lag
	if(start_loop) Ref.bigatom_walkloop()

proc/bigatom_walk_rand(atom/movable/Ref, Lag = 0)
	// BigAtom version of walk_rand()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	var/start_loop = !Ref.bigatom_walkmode
	Ref.bigatom_walkmode = BIGATOM_WALK_RAND
	Ref.bigatom_walklag = Lag
	if(start_loop) Ref.bigatom_walkloop()

proc/bigatom_walk_to(atom/movable/Ref, Trg, Min = 0, Lag = 0)
	// BigAtom version of walk_to()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	var/start_loop = !Ref.bigatom_walkmode
	Ref.bigatom_walkmode = BIGATOM_WALK_TO
	Ref.bigatom_walktarget = Trg
	Ref.bigatom_walkdistance = Min
	Ref.bigatom_walklag = Lag
	if(start_loop) Ref.bigatom_walkloop()

proc/bigatom_walk_towards(atom/movable/Ref, Trg, Lag = 0)
	// BigAtom version of walk_towards()
	if(!istype(Ref)) return
	if(Ref.bigatom_src) Ref = Ref.bigatom_src
	var/start_loop = !Ref.bigatom_walkmode
	Ref.bigatom_walkmode = BIGATOM_WALK_TOWARD
	Ref.bigatom_walktarget = Trg
	Ref.bigatom_walklag = Lag
	if(start_loop) Ref.bigatom_walkloop()









/******************************************************************
BigAtom Utilities by Shadowdarke (shadowdarke@hotmail.com) April 2006
bigatom_LocForPart() and bigatom_MapBoundaryCheck() procs by Deadron

These procs are nonessential expansions for the basic BigAtom library.
Including the library will not automatically include these procs.

You may include them by adding the following line to your project:
	#include <BigAtomUtilies.dm>

New atom/movable/procs:
	bigatom_Cull(flags)
		Removes unneeded atoms from the bigatom_parts list. This function only works with
			big atoms in overlay mode.
		ARGS:
			flags - Tells the proc how to determine what atoms are important. Accepts
				the following values:
					BIGATOM_KEEP_EDGES		(1) - keep parts on the outside edge of the big atom
					BIGATOM_KEEP_CORNERS	(2) - keep parts in the corners of the big atom
					BIGATOM_KEEP_DENSE		(4) - keep parts that are dense
					BIGATOM_KEEP_OPAQUE		(8) - Keep parts that are opaque
				The flags may be combined by the OR (|) operator to keep parts based on multiple
					criteria. For example, bigatom_Cull(BIGATOM_KEEP_DENSE | BIGATOM_KEEP_EDGES)
					will preserve any parts that are dense or on the edge of the big atom
				DEFAULT: flags = BIGATOM_KEEP_CORNERS | BIGATOM_KEEP_DENSE | BIGATOM_KEEP_OPAQUE

	bigatom_LocForPart(atom/movable/part, turf/Location)
		For the given destination, where should this part be placed relative to bigatom_src?

	bigatom_MapBoundaryCheck(turf/Location)
		Returns 1 if the big atom will be entirely on the map at this location, zero if not.

******************************************************************/

#define BIGATOM_KEEP_EDGES		1
#define BIGATOM_KEEP_CORNERS	2
#define BIGATOM_KEEP_DENSE		4
#define BIGATOM_KEEP_OPAQUE		8

atom/movable/proc
	bigatom_Cull(flags = BIGATOM_KEEP_CORNERS | BIGATOM_KEEP_DENSE | BIGATOM_KEEP_OPAQUE)
		// remove unneeded atoms from the parts list
		if(bigatom_src != src)
			if(bigatom_src) bigatom_src.bigatom_Cull(flags)
			return
		if(bigatom_mode & BIGATOM_NOOVERLAYS)
			// can only cull in overlays mode
			return
		for(var/atom/movable/M in bigatom_parts)
			if(density && (flags & BIGATOM_KEEP_DENSE)) continue
			if(opacity && (flags & BIGATOM_KEEP_OPAQUE)) continue
			if(flags & BIGATOM_KEEP_EDGES)
				var/pos_x = M.bigatom_x - bigatom_x + 1
				var/pos_y = M.bigatom_y - bigatom_y + 1
				if(!pos_x || (pos_x == bigatom_width) || \
					!pos_y || (pos_y == bigatom_height)) continue
			else if(flags & BIGATOM_KEEP_CORNERS)
				var/pos_x = M.bigatom_x - bigatom_x + 1
				var/pos_y = M.bigatom_y - bigatom_y + 1
				if((!pos_x || (pos_x == bigatom_width)) && \
					(!pos_y || (pos_y == bigatom_height))) continue
			del(M)

	bigatom_LocForPart(atom/movable/part, turf/Location)
		/* For the given destination, where should this part be placed relative to
			bigatom_src? */
		var/column_offset = Location.x + part.bigatom_x
		var/row_offset = Location.y + part.bigatom_y

		var/turf/destturf = locate(column_offset, row_offset, Location.z)
		if (!destturf || !destturf.Enter(part))
			return 0
		return destturf

	bigatom_MapBoundaryCheck(turf/Location)
		// Returns 1 if the object will be entirely on the map at this location, zero if not.
		var/top_x = Location.x + (bigatom_width - 1)
		var/top_y = Location.y + (bigatom_height - 1)

		if (top_x < 1 || top_y < 1 || top_x > world.maxx || top_y > world.maxy)
			return 0
		return 1
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*AbyssDragon.BasicMath v1.1
  written by AbyssDragon (abyssdragon@,molotov.nu)
  http://www.molotov.nu

  (used to be AbyssDragon.AbyssLibrary)

  Feel free to modify/improve/destroy/steal/use any of this code however you see fit.
  A thanks or mention in your project would be nice, but neither are required.

  This is a library of procs to do some basic math and geometrical things.
  Many of the procs in the old version of this have been invalidated since then and have been removed.
  A lot of these procs may be duplicated in other BYOND libraries/demos.  However, all of this code
  was written by me, or was adapted from C libraries/tutorials by me.
*/
var
	const//Some nice and lengthy mathematical constants.  BYOND rounds them off, but I like to have 'em handy anyway.
		pi =	3.1415926535897932384626433832795
		sqrt2 =	1.4142135623730950488016887242097	//Square root of 2
		e =		2.7182818284590452353602874713527


proc
	xrange(atom/center, range)
		var/startx = center.x - range
		var/starty = center.y - range
		var/endx = center.x + range
		var/endy = center.y + range
		if(startx < 1) startx = 1
		if(starty < 1) starty = 1
		if(endx > world.maxx) endx = world.maxx
		if(endy > world.maxy) endy=world.maxy
		var/contents[] = list()
		for(var/turf/T in block(locate(startx, starty, center.z), locate(endx, endy, center.z)))
			contents += T
			contents += T.contents
		return contents

	get_steps(atom/ref,dir,num)
		var/x
		var/turf/T=ref:loc
		if(isturf(ref))
			T=ref
		for(x=0;x<num;x++)
			ref=get_step(ref,dir)
			if(!ref)break
			T=ref
		return T

	allclear(turf/T)
		if(isturf(T))
			if(T.density) return 0
		var/mob/M
		for(M as mob|obj in T)
			if(M.density)
				return 0
		return 1

	cardinal(atom/ref)
		return (list(get_step(ref,NORTH),get_step(ref,SOUTH),get_step(ref,EAST),get_step(ref,WEST)))

	cardinal_stuff(atom/ref)
		var/turfs[]=list(get_step(ref,NORTH),get_step(ref,SOUTH),get_step(ref,EAST),get_step(ref,WEST))
		var/stuff[]=list()
		var/turf/T
		for(T in turfs)
			stuff+=T.contents
		return stuff

	midpoint(atom/M,atom/N)
		var/turf/T = locate((N.x + M.x)/2, (N.y + M.y)/2, (N.z + M.z)/2)
		return T

	distance(atom/M,atom/N)
		return sqrt((N.x-M.x)**2 + (N.y-M.y)**2)

	getring(atom/M, radius)
		var/ring[] = list()
		var/turf/T
		for(T as turf in range(radius+1,M))
			if(abs(distance(T, M)-radius) < 0.5)//The < 0.5 check is to make sure the ring is smooth
				ring += T
		return ring

	getcircle(atom/M, radius)
		var/list/circle = list()
		var/turf/T
		for(T as turf in range(radius+3,M))		//The < 0.5 check is to ensure it has the same shape as
			if(distance(T, M) < radius + 0.5) 	//a get_ring() of the same radius
				circle += T
		return circle

	sign(x) //Should get bonus points for being the most compact code in the world!
		return ((x<0)?-1:((x>0)?1:0))

	getline(atom/M,atom/N)//Ultra-Fast Bresenham Line-Drawing Algorithm
		var/px=M.x		//starting x
		var/py=M.y
		var/line[] = list(locate(px,py,M.z))
		var/dx=N.x-px	//x distance
		var/dy=N.y-py
		var/dxabs=abs(dx)//Absolute value of x distance
		var/dyabs=abs(dy)
		var/sdx=sign(dx)	//Sign of x distance (+ or -)
		var/sdy=sign(dy)
		var/x=dxabs>>1	//Counters for steps taken, setting to distance/2
		var/y=dyabs>>1	//Bit-shifting makes me l33t.  It also makes getline() unnessecarrily fast.
		var/j			//Generic integer for counting
		if(dxabs>=dyabs)	//x distance is greater than y
			for(j=0;j<dxabs;j++)//It'll take dxabs steps to get there
				y+=dyabs
				if(y>=dxabs)	//Every dyabs steps, step once in y direction
					y-=dxabs
					py+=sdy
				px+=sdx		//Step on in x direction
				line+=locate(px,py,M.z)//Add the turf to the list
		else
			for(j=0;j<dyabs;j++)
				x+=dxabs
				if(x>=dyabs)
					x-=dyabs
					px+=sdx
				py+=sdy
				line+=locate(px,py,M.z)
		return line