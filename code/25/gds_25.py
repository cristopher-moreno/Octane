import pandas as pd
import numpy as np

df = pd.read_csv('data.csv', dtype={'num_poliza': str, 'num_doc': str})

# print(df.head(5))
# num_prestamo = [(e)for(e) in (df['num_doc'])]
# 9727060100069 antes
# 0791060641182 después

num_prestamo = [('9'+e[1::1])for(e) in (df['num_doc'])]

df_prestamos = pd.DataFrame({'cod_producto': df['cod_producto'],
                             'num_poliza': df['num_poliza'],
                             'num_prestamo_curr': df['num_doc'],
                             'num_prestamo_mod': num_prestamo,
                             })

df_prestamos.to_csv('data_mod.csv', index=False)
print(df_prestamos)
