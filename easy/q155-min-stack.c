//  ****************************************************************************
//  File      :  q155-min-stack.c
//  Method    :  leetcode-c
//  Source    :  https://leetcode.com/problems/min-stack/description/
//  Author    :  Joseph_Wu on 17/9/28.
//  ****************************************************************************
//  Design a stack that supports push, pop, top, and 
//  retrieving the minimum element in constant time.

//  push(x) -- Push element x onto stack.
//  pop() -- Removes the element on top of the stack.
//  top() -- Get the top element.
//  getMin() -- Retrieve the minimum element in the stack.
//******************************************************************************

#include <stdio.h>
#include <stdlib.h>

typedef struct MinStack {
	int size;	// stack max size
	int num;	// num of elements in stack
	int *top;	// store each element into top stack
	int *min;	// store each miner element into min stack
} MinStack;

/** initialize your data structure here. */
MinStack* minStackCreate(int maxSize) {
	struct MinStack* s = malloc(sizeof(*s));

    s->size = maxSize;
    s->num = 0;

    s->top = malloc(maxSize * sizeof(s->top));
    s->min = malloc(maxSize * sizeof(s->min));
    return s;
}

void minStackPush(MinStack* obj, int x) {

	// 0. return if stack is full
	if (obj->size  <= obj->num) return;

	// 1. push to top stack
	// 2. compare with current min and fill the miner one into min stack 
	if (0 == obj->num) {
		*obj->min = x;
	} else {
		if (x <= *(obj->min - 1)) {
			*obj->min = x;
		} else {
			*obj->min = *(obj->min - 1);
		}
	}

	*obj->top++ = x;
	obj->min++;
	obj->num++;
}

void minStackPop(MinStack* obj) {

	// return if stack is empty
	if (0 == obj->num) return;

	--obj->min;
	--obj->top;
	--obj->num;
}

int minStackTop(MinStack* obj) {

	return (0 == obj->num) ? 0 : *(obj->top - 1);
}

int minStackGetMin(MinStack* obj) {

	return (0 == obj->num) ? 0 : *(obj->min - 1);
}

void minStackFree(MinStack* obj) {
	
	obj->top = NULL;
	obj->min = NULL;
	free(obj->top);
	free(obj->min);
    free(obj);
}

int main()
{
    struct MinStack* stack = minStackCreate(100);
 
    // one test case
    minStackPush(stack, -2);
    minStackPush(stack, 0);
    minStackPush(stack, -3);
    minStackGetMin(stack);
    minStackPop(stack);
    minStackTop(stack);
    minStackGetMin(stack);
    minStackFree(stack);
 
    return 0;
}

/**
 * Your MinStack struct will be instantiated and called as such:
 * struct MinStack* obj = minStackCreate(maxSize);
 * minStackPush(obj, x);
 * minStackPop(obj);
 * int param_3 = minStackTop(obj);
 * int param_4 = minStackGetMin(obj);
 * minStackFree(obj);
 */