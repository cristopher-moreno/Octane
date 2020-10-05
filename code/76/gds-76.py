import pandas as pd

# Read .csv raw data: "num_doc","ide_poliza","num_poliza","ide_producto"
df1 = pd.read_csv('ince.csv', dtype={
                 'num_doc': str,
                 'ide_poliza': str,
                 'num_poliza': str,
                 'ide_producto': str,})

df2 = pd.read_csv('dcol.csv', dtype={
                 'num_doc': str,
                 'ide_poliza': str,
                 'num_poliza': str,
                 'ide_producto': str,})


#Do Inner Join dropping NaN
innerjoin =df1.join(df2.set_index('num_doc'), on='num_doc',lsuffix='_INCE', rsuffix='_DCOL').dropna()

#Organize
result = pd.DataFrame({'num_doc': innerjoin['num_doc'],
                             'num_poliza_INCE': innerjoin['num_poliza_INCE'],
                             'num_poliza_DCOL': innerjoin['num_poliza_DCOL'],
                             })

#Export it
result.to_csv('result.csv', index=False)

print(result.head())