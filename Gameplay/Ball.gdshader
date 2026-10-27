shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 distortedUV = UV;
	if (distortedUV.x > sin(TIME)){		
		vec4 pixelColor = texture(TEXTURE, distortedUV);
		pixelColor = vec4(0.0, 0.0, 0.0, sin(TIME * 1000.0));
		}
}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
