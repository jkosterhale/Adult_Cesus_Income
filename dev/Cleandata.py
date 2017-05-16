################Cleaned data version3####################
import numpy as np
import pandas as pd

import plotly.offline as py
import plotly.figure_factory as ff
import plotly.graph_objs as gobj

SHARED_FOLDER = '/Users/liqian/git/Dataiku_test/ressources/us_census_full'

with open ('{}/train.csv'.format(SHARED_FOLDER), 'rb') as f:
    train_df = pd.read_csv(f)

##So we found missing data in GRINREG, MIGMTR1, MIGMTR3, MIGMTR4, MIGSUN, PEFNTVTY, PEMNTVTY,
## TENATVTY

categorized_cols = ['ACLSWKR', 'ADTIND', 'ADTOCC', 'AHGA', 'AHSCOL', 'AMARITL', 'AMJIND', 'AMJOCC',
 'ARACE', 'AREORGN', 'ASEX', 'AUNMEM', 'AUNTYPE', 'AWKSTAT', 'FILESTAT', 'GRINREG', 'GRINST', 'HHDFMX',
  'HHDREL', 'MIGMTR1', 'MIGMTR3', 'MIGMTR4', 'MIGSAME', 'MIGSUN', 'PARENT', 'PEFNTVTY', 'PEMNTVTY', 'PENATVTY',
   'PRCITSHP', 'SEOTR', 'VETQVA', 'VETYN', 'YEAR', 'INCOME']

