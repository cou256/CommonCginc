Shader "Test/Color/ToHsvTest" {
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
	}
	SubShader{
		Tags{ "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0
		#include "../cginc/Color.cginc"

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		fixed4 _Color;
		half _Glossiness;
		half _Metallic;

		void surf(Input IN, inout SurfaceOutputStandard o) {
			float3 h = hsv(_Color.r, _Color.g, _Color.b);
			o.Albedo = rgb(h.x, h.y, h.z);
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = 1.0;
		}
		ENDCG
	}
	FallBack "Diffuse"
}