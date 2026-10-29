# Prompts — waste food bin hook

1. there is a single image in this folder of a hook device designed for holding a waste food caddy on the the back of a cupboard door. Are you able to make sense of it and reproduce in OpenSCAD?
2. if you notice on the picture, it is fitted to a shaker style where the door panel where the screw holes will go is actually too thin to mount screws. So I would like to extend the back plate vertically with holes nearer the top instead of the bottom. Size paramaterised and TBC
3. the lower half needs thickening at the rear so it fits within the shaker door inner panel, while the top where the screw holes go will be thinner.
4. there is no need for the hook to have any part of the backplate to hang under the hook part now that we removed the mounting holes from the bottom.
5. the top part of the back panel, where the holes are should be 50mm tall, the thicker part of the back panel should be 90mm from the "step" down to the top of the "dowel", though obviously the total height of this thicker stepped part will be more than 90mm to account for where the hook part joins
6. I'd estaimte total plate height around 160mm (based on 20mm being used from the top of the "dowel" to the bottom of the baseplate
7. my rail dia was measured at 10mm, and i had 20mm from top of rail to bottom of back plate so that there was plenty of material on the bracket to hold the weight
8. under the rail can be an angled chamfer instead of a rectangular block. There is an odd chamfer where the step is. It seems to run halfway along the step
9. panel recess is 5.5mm
10. screw hole positions are fine. 4mm slot is fine. The actual caddy's platic as less than 1mm. The overall width of the rail should not exceed 90mm
    (answered: whole part 90 mm wide, not just the rail)
11. reduce the plate width to 80
12. when printing on its side, there will be overhangs. Can we make the ends competely flush
13. is it possible to export and slice just a small portion of the hook part so i can test it
14. change of plan, make the test piece the full height (in the fitted orientation of hook at the bottom, holes at the top), but only 10mm. i.e. the same slices as the full part, just less of them
15. no need for holes on the test piece
16. make a change to the print... the hook needs to be 10mm closer to the top, ie.e. the who height shrinks by 10mm, but the height is taken not taken off the top 50mm section with the screwhols, but from the bottom section
17. when slicing i want to keep it strong but reduce print time and filament usage. Would thicker walls with only 10% infill work?
18. yes, add -Walls and -Infill overrides
19. if 4 walls is solid up to 4.0mm, then lets change the model so that the screwhole section is 4.0mm thick
