# Natural Language Processing

# loading packages
library(caret)
library(e1071)

# Importing dataset
our.data = read.csv("input/Restaurant_Reviews.tsv", sep = "\t", 
                    quote = '', stringsAsFactors = F)

# Cleaning the texts
install.packages("tm")
install.packages("SnowballC")
library(tm)
library(SnowballC)

corpus = VCorpus(VectorSource(x = our.data$Review))

# converting all upercase letter to lower case
corpus = tm_map(x = corpus, content_transformer(tolower))

# removing all the numbers from the reviews.
corpus = tm_map(x = corpus, removeNumbers)

# removing puntuation from the reviews
corpus = tm_map(x = corpus, removePunctuation)

# removing not useful words
corpus = tm_map(x = corpus, removeWords, stopwords())

# change words to root words
corpus = tm_map(x = corpus, stemDocument)

# remove extra space
corpus = tm_map(x = corpus, stripWhitespace)

# creating a Bag of Words model
dtm = DocumentTermMatrix(corpus)

# filter all non frequent words
dtm = removeSparseTerms(dtm, 0.999)

# creating a dataset 
our.data.mod = as.data.frame(as.matrix(dtm))
our.data.mod$liked = as.factor(our.data$Liked)

# Spiliting the data into train and test
indexes = createDataPartition(our.data.mod$liked, times = 1, p = 0.8, list = F)
trd = our.data.mod[indexes, ]
tsd = our.data.mod[-indexes, ]


# Creating a classifier - NB
our.classifier = naiveBayes(x = trd[-692], y = trd$liked)

# Predicting the test result
our.pred = predict(our.classifier, newdata = tsd[-692])
confusionMatrix(our.pred, tsd$liked)

# creating a classifier - random forest
library(randomForest)
our.classifier.rf = randomForest(x = trd[-692], y = trd$liked)
our.pred.rf = predict(our.classifier.rf, newdata = tsd[-692])
confusionMatrix(our.pred.rf, tsd$liked, positive = '1')
