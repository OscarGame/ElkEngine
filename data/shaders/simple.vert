#version 330 core

layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 1) in vec3 vertexNormal_modelspace;

out vec3 Normal_viewspace;
out vec3 vertexPosition_viewspace;
out vec3 lightPosition_viewspace;

uniform vec3 lightPosition;

uniform mat4 M;
uniform mat4 V;
uniform mat4 P;

void main(){
	gl_Position = P * V * M * vec4(vertexPosition_modelspace,1);

	Normal_viewspace = ( V * M * vec4(vertexNormal_modelspace,0)).xyz; // Only correct if ModelMatrix does not scale the model ! Use its inverse transpose if not.
	vertexPosition_viewspace = ( V * M * vec4(vertexPosition_modelspace,1)).xyz; // Only correct if ModelMatrix does not scale the model ! Use its inverse transpose if not.
	lightPosition_viewspace = ( V * vec4(lightPosition,1)).xyz;
}