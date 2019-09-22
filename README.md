# ResturantReviews
A MachineLearning problem to predict whether a customer liked the resturant or not based on his/her review.

## Input
### Dataset
Our dataset contains two columns - a) Reviews b) Liked
a) #### Review: This column contains the review of the customer in text format.
b) #### Liked: This column contains binary value 1 and 0, informing whether the customer liked the restuarnt or not.

## Cleaning the text
I use Text Mining Package (tm) in R to clean the text. Did following operations to clean the text.
<ul>
  1. Convert all text to lower case. So there should only be one instance present of that word.
      For example: If a word 'love' is present in both lower case and in upper case. Then there would be two instance of the same word, that will create redundancy. Hence to avoid that redundancy we convert all words into same case either lower or upper, in this case I convert it to lower case.
