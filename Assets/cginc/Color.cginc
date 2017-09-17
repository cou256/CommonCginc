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
float3 hsv (float r, float g, float b) {
	float max = _max(r, _max(g, b));
	float min = _min(r, _min(g, b));
	if (max == 0){
		return float3(0.0, 0.0, 0.0);
	}
	float h = max - min;
	if (h > 0.0f) {
		if (max == r) {
			h = (g - b) / h;
			if (h < 0.0f) {
				h += 6.0f;
			}
		}
		else if (max == g) {
			h = 2.0f + (b - r) / h;
		}
		else {
			h = 4.0f + (r - g) / h;
		}
	}
	h /= 6.0;
	float s = (max - min);
	if (max != 0.0f)
	{
		s /= max;
	}
	float v = max;
	return float3(h, s, v);
}
float3 rgb (float h, float s, float v) {
	float r, g, b;
	r = g = b = v;
	if (v== 0.0) {
		return float3(r, g, b);
	}
	h *= 6.0f;
	float i = trunc(h);
	float f = frac(h);
	if (i == 0) {
		g *= 1 - s * (1 - f);
		b *= 1 - s;
	} else
	if (i == 1) {
		r *= 1 - s * f;
		b *= 1 - s;
	} else
	if (i == 2) {
		r *= 1 - s;
		b *= 1 - s * (1 - f);
	} else
	if (i == 3) {
		r *= 1 - s;
		g *= 1 - s * f;
	} else
	if (i == 4) {
		r *= 1 - s * (1 - f);
		g *= 1 - s;
	} else
	if (i == 5) {
		g *= 1 - s;
		b *= 1 - s * f;
	}
	return float3(r, g, b);
}