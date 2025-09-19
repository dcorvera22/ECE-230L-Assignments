# Lab 04 - SOP/POS and KMaps

In this lab, you’ve learned how to apply KMaps, Sum Of Products and Products of
sums to simplify digital logic equations. Then, you’ve proven out that they work
using an implemented design on your Basys3 boards.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Summary

During this lab we struggled but learned a lot from it. We learned how we can better optimize our code by using SOP and POS with KMaps. This gave us a simpler way to simplify our code and not have extra processes bloating our system. 

## Lab Questions

### Why are the groups of 1’s (or 0’s) that we select in the KMap able to go across edges?
In KMaps the reason you are able to go across edge is due KMaps using something called Gray code which means that successive values only differ by one bit. This makes it possible for it to go across edges due to the difference between them is one bit. 

### Why are the names Sum of Products and Products of Sums?
The names are called that for how they interact with our formulas. When we write our Sum of Products we typically just use a form of algebra notation that when looked at gives us those names. Sum of Products written out as a formula look like the Summation of multiplying two variables and vice versa.  

### Open the test.v file – how are we able to check that the signals match using XOR?

