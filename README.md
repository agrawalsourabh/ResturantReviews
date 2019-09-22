# ResturantReviews
A MachineLearning problem to predict whether a customer liked the resturant or not based on his/her review.

## Input
### Dataset
Our dataset contains two columns - a) Reviews b) Liked </br>
a) **Review**: This column contains the review of the customer in text format. </br>
b) **Liked**: This column contains binary value 1 and 0, informing whether the customer liked the restuarnt or not.</br>

### Basic Idea
Basic Idea behind the model creation is - we will create a column for every word in the review column, and if the particular word present in the review, then we put 1 and if not then we put 0. This will undoubtly creates a sparse matrix. 

### Cleaning the text
I use Text Mining Package (tm) in R to clean the text. Did following operations to clean the text. </br>
  - **Convert all text to lower case**. So there should only be one instance present of that word.
      _For example_: If a word _'love'_ is present in both lower case and in upper case. Then there would be two instance of the same word, that will create redundancy. Hence to avoid that redundancy we convert all words into same case either lower or upper, in this case I convert it to lower case.
      - **Removing all the numbers and puntuations from the Reviews column**. Because if any number say phone number or address or something like that persent in our review that will not help our model to more accurately predict the results, so we remove the numbers from the reveiw column.
      - **Removing all not useful words from the Reviews column**. Articles, prepositions these type of words will not help our model to more accurately predict the results, so we will removes these kinds of words from our reveiw column.
      
In this way, we filterout some words to make our data set more efficient to predict the results.
