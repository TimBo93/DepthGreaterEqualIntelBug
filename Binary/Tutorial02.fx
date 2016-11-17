//--------------------------------------------------------------------------------------
// File: Tutorial02.fx
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//--------------------------------------------------------------------------------------

struct PS_INPUT
{
	float4 Position : SV_Position;
	float4 SomeValue : TEXCOORD;
};


struct PS_OUTPUT
{
	float depth : SV_DepthGreaterEqual;
	float4 color : SV_TARGET0;
};


//--------------------------------------------------------------------------------------
// Vertex Shader
//--------------------------------------------------------------------------------------
PS_INPUT VS( float4 Pos : Position)
{
	PS_INPUT pin = (PS_INPUT)0;
	pin.Position = Pos;
	pin.SomeValue = 5;
    return pin;
}


//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
PS_OUTPUT PS(PS_INPUT pin)
{
	PS_OUTPUT res = (PS_OUTPUT)0;	
	res.color = float4(1.0f, 0.0f, pin.SomeValue.x*0.1f , 1.0f);    // Yellow, with Alpha = 1
	res.depth = 0.7f;
	return res;
}
