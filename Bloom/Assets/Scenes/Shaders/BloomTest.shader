Shader "Unlit/BloomTest"
{
    Properties
    {
        _MainTex ("Base(RGB)", 2D) = "white" {}
        _Bloom ("Bloom(RGB)", 2D) = "black" {}
        _LuminanceThreshold ("Luminance Threshold", Float) = 0.5
        _BlurSize ("Blur Size", Float) = 1.0
    }
    SubShader
    {
        CGINCLUED
        #include "UnityCG.cginc"
        sampler2D _MainTex;
        half4 _MainTex_TexelSize;
        sampler2D _Bloom;
        float _LuminanceThreshold;
        float _BlurSize

        ZTest Always Cull Off ZWrite Off
        Pass {
            CGPROGRAM
            #pragma vertex vertExtractBright
            #pragma fragment fragExtracBright
            ENDCG
        }

        Pass {
            CGPROGRAM
            #pragma vertex vertBlurVertical
            #pragma fragment fragBlur
            ENDCG
        }

        Pass {
            CGPROGRAM
            #pragma vertex vertexBlurHorizontal
            #pragma fragment fragBlur
            ENDCG
        }

        Pass {
            CGPROGRAM
            #pragma vertex vertexBloom
            #pragma fragment fragBloom
            ENDCG
        }
    }
}
