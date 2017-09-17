/**
 * Reference
 * https://ja.wikipedia.org/wiki/HSV%E8%89%B2%E7%A9%BA%E9%96%93
 */
float _max(float a, float b) {
	if (a >= b) {
		return a;
	} else {
		return b;
	}
}
float _min(float a, float b) {
	if (a <= b) {
		return a;
	} else {
		return b;
	}
}
float3 hsv (float3 rgb) {
	float r = rgb.x;
	float g = rgb.y;
	float b = rgb.z;
	
	float max = _max(r, _max(g, b));
	float min = _min(r, _min(g, b));
	float d = max - min;
	if (max == 0){
		return float3(0.0, 0.0, 0.0);
	}
	float s = d / max;
	float h = 0.0;
	if (min == b) {
		h = (rgb.y - rgb.x) / d + 1.0;
	}else
	if (min == r) {
		h = (rgb.z - rgb.y) / d + 3.0;
	}else
	if (min == g) {
		h = (rgb.x - rgb.z) / d + 5.0;
	}
	h /= 6.0;
	return float3(h, s, max);
}
float3 rgb (float3 hsv) {
	float h = hsv.x;
	float s = hsv.y;
	float v = hsv.z;
	float r, g, b;
	r = g = b = v;
	if (v== 0.0) {
		return float3(r, g, b);
	}
	h *= 6.0f;
	float i = trunc(h);
	float f = h - i;
	float _a = 1.0 - s;
	float _b = 1.0 - f;
	float _c = _a * _b;
	float _d = _a * f;
	if (i == 0.0) {
		g *= _c;
		b *= _a;
	} else
	if (i == 1.0) {
		r *= _d;
		b *= _a;
	} else
	if (i == 2.0) {
		r *= _a;
		b *= _c;
	} else
	if (i == 3.0) {
		r *= _a;
		g *= _d;
	} else
	if (i == 4.0) {
		r *= _c;
		g *= _a;
	} else
	if (i == 5.0) {
		g *= _a;
		b *= _d;
	}
	return float3(r, g, b);
}