# Adult_Cesus_Income

* Introduction
* Data Analysis
	* Explore Categorical Data
	* Explore Contineous Variable
* Clean Data
* Modelisation
	* Logistic Regression


## Introduction
*That's the exploration on the dataset from the census bureau database with Jupyter Notebook*

## Data Analysis
### Explore Categorical Data 
*The completed code of that part is in DataAnalysis.ipynb. In fact, I use R add column name for each variable and find the missing data. At the first time, I want to explore the categoric variables with ploting the distribution of different value for each variable. We can easily find the percent of every value existed in the whole dataset. In fact, the missing data is presneted by "?" , we can also get their percents from graphs. And we also know that the missing data exist only in the follow variables : So we found missing data in GRINST, MIGMTR1, MIGMTR3, MIGMTR4, MIGSUN, PEFNTVTY, PEMNTVTY, PENATVTY. For example, the missing rate of MIGMTR1 is 49.97% which is a little large for the dataset.*
*The function is plot_categoric(col).*

![MIGMTR1](/ressources/graph/MIGMTR1.png)

*And I also want to know the relationship between income level and the variable value. For example, we can find that 34.73% of the self-employed-incorporated are in the income level of 50000+ . The private sector, which has the most people work in, has the largest number of population that earn more than 50K per year. However, in terms of the proportion, the self-employed people are the winner.*
*The function is plot_categoric_comp(col).*

![below:above_ACLSWKR.png](/ressources/graph/below:above_ACLSWKR.png)

### Explore Contineous Variable 
*In that part, I want to plot two different graphs, one for normal data(excluded zero and outlier) and the other for zero and outliers.*
*We can get a graph as below with the function plot_disc_normal(col), the distribution of wage per hour is clear in that graph: *

![AHRSPAY](/ressources/graph/AHRSPAY.png)

*And with the function plot_disc_outlier, we can plot the number and precent of the people who has a wage that exceed the range of three standard deviations of wage serie.*

![AHRSPAY_outlier](/ressources/graph/AHRSPAY_outlier.png)

### Clean Data
*In this step, it should fill all the missing data and also encoder the categoric data for a better performance in the step of modeling. In fact, I think it also should regrouper the categoric data cause we don't have enough data but for some variables, the value possible is too many, that may influence the performance of model. I've just done that for two variable cause it will take much more time in this step. Normally, I think that there're also more variables should be added depend on the result of analysis, for exemple the variable calculée by others. Although I didn't do that in that simple test. Besides, to make numeric features more normal, I use the skew function.*

### Modelisation
*In fact, we could get a correlation between varivales as below: *

![correlation](/ressources/graph/correlation.png)

*We can find a strong correlation between WKSWORK and NOEMP with a ratio 0.837128 which means the number of weeks worked in year of a person has a strong relation with the number of persons worked for that same employer. Normally we could delete either variable but I'm not sure they will have the same influence in the model. So I kept all maybe related variables. *

**Logistic Regression**

*Distribution of real and predicted value: *
![LogisticRegression](/ressources/graph/LogisticRegression.png)

*Feature Importance: *
![LogisticRegression_importance](/ressources/graph/LogisticRegression_importance.png)

**Random Forest**

*Distribution of real and predicted value: *
![RandomForest](/ressources/graph/RandomForest.png)

*Feature Importance: *
![RandomForest_importance](/ressources/graph/RFC_importance.png)

**XGBoost**

*Distribution of real and predicted value: *
![XGB](/ressources/graph/XGB.png)

*Feature Importance: *
![XGB_importance](/ressources/graph/XGB_importance.png)

*With the comparison of accuracy score, the model of XGBoost has a better performance, so I use XGBoost for the income prediction.*

*The comparison of accuracy: *
![Accuracy](/ressources/graph/accuracy.png)

*And the prediction of test data with XGBoost is : *
![XGB_target](/ressources/graph/XGB_target.png)



