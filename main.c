#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// Declaring that assembly function is provided elsewhere
extern void asm_function();

// This should be the C equivalent to the assembly implementation
void c_function(int *mass, int n) {
	for (int k = 2; k*k <= n; k++)
	{
		if (mass[k] != 0){
			for (int l = 2*k; l <= n; l += k){
				mass[l] = 0;
			}
		}
	}
}

int main(int argc, char **argv) {

	printf("Welcome to Eratosthenes sieve test\n");
	int n;
	n = 1000000;
	int *mass;
	int *mass_copy;
	mass = (int *)malloc(n * sizeof(int));
	mass_copy = (int *)malloc(n * sizeof(int));
	mass[0] = mass_copy[0] = 0;
	mass[1] = mass_copy[1] = 1;
	
	for (int k = 2; k<=n; k++)
	{
		mass[k] = k;
		mass_copy[k] = k;
	}
	
	printf("C function test begins\n");
	
	c_function(mass, n);
	
	printf("C function test ends\n");

	printf("Assembly function test begins\n");

	asm_function(mass_copy, n);

	printf("Assembly function test ends\n");

	return 0;
	
}
