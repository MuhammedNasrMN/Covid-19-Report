import pandas as pd

df = pd.read_csv('E:\\Covid Project\\covid_data.csv')
print(df.dtypes)

df.dropna(subset=['continent'], inplace=True) #delete rows containing irrelevent data

df.to_csv('E:\\Covid Project\\covid_data_cleaned.csv')