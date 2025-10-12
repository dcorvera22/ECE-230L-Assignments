# Number Theory: Subtraction

In this lab you've learned the basics of number theory as it relates to subtraction.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

##Summary
We learned how we can use a full adder but manipulate it, using different techniques to subtract two binary numbers. 
## Lab Questions

### 1 - Explain the differences between our Half Adder from last lab and the Half Subtractor from this lab.
They are both arithmetic operations but the differences lie in the Carry and Borrow outputs. In Half Adder you use a AND gate to get Cout, but in Half Sub, you use a NOT gate to get Bout. 
### 2 - What about the end around carry of One’s Complement makes it hard to use and implement?
The reason it is harder to use and implement is because you require an extra addition step. Another part is that the system can run into a loop with the logic that will never end. 
### 3 - What is the edge case and problem with Two’s Complement number representation?
The problem with Two's Complement is that you can run into an overflow error. This is because once you reach the most negative number and try to invert it, it is still the most negative number and causes the overflow. 
