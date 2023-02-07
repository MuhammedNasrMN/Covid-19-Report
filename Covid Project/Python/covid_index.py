import pandas as pd

df = pd.read_csv('E:\\Covid Project\\covid_vac.csv')
df2 = pd.read_csv('E:\\Covid Project\\covid_deaths.csv')
df['idx'] = df.groupby(['location']).ngroup()
df2['idx'] = df2.groupby(['location']).ngroup()

df2.to_csv('E:\\Covid Project\\covid_deaths1.csv')
