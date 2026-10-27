shader_type canvas_item;

uniform float Height : hint_range(0.0, 2.0);
uniform float Width : hint_range(0.0, 200.0);
void fragment() {
	vec2 distortedUV = UV;
	distortedUV.y /= 2.0;
	distortedUV.x += 2.0;
	vec2 flipY = UV * -1.0;
	vec4 pixelColor = texture(TEXTURE, distortedUV);
	
	if (distortedUV.y > (Height + sin(distortedUV.x * Width)) / 2.0) {
		pixelColor = vec4(0.0, 1.0, 0.0, 1.0) + distortedUV.y * -1.0;
	} else {
		pixelColor = vec4(0.0, 0.6, 0.9, 0.) + distortedUV.y * -1.0;
	}
	if (distortedUV.x > sin(TIME)){
		distortedUV = vec2(sin(TIME));
	}
	COLOR = pixelColor;
}
	
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
