# ResturantReviews
A MachineLearning problem to predict whether a customer liked the resturant or not based on his/her review.

# Cleaning the text
I use Text Mining Package (tm) in R to clean the text. Did following operations to clean the text.
<ul>
  1. Convert all text to lower case. So there should only be one instance present of that word.
      For example: If a word 'love' is present in both lower case and in upper case. Then there would be two instance of the same word, that will create redundancy. Hence to avoid that redundancy we convert all words into same case either lower or upper, in this case I convert it to lower case.
