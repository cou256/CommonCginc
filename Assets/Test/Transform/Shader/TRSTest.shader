Shader "Test/Transform/TRSTest"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			#include "../../../Cginc/Transform.cginc"

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};
			float3 _Translate;
			float3 _Rotate;
			float3 _Scale;
			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			v2f vert (appdata_full v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(trs(v.vertex, _Translate, _Rotate, _Scale));
				o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				return o;
			}
			fixed4 frag (v2f i) : SV_Target
			{
				return tex2D(_MainTex, i.uv);
			}
			ENDCG
		}
	}
}
