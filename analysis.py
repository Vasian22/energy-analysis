import pandas as pd
df = pd.read_csv("household_power_consumption.txt",sep = ";",na_values=["?"],low_memory = False)
df["datetime"]=pd.to_datetime(df["Date"]+" "+df["Time"], format= "%d/%m/%Y %H:%M:%S")
print(df.shape)
print(df.dtypes)
print(df.isna().sum())
print(df.duplicated().sum())
print(df["datetime"].min(),df["datetime"].max())
missing = df[df["Global_active_power"].isna()]
gaps = (missing["datetime"].diff() != pd.Timedelta(minutes=1)).cumsum()
blocks = missing.groupby(gaps)["datetime"].agg(["min", "max", "count"])
print(len(blocks), "outage blocks")
print(blocks.sort_values("count", ascending=False).head(5))
cols = ["Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"]
df=df.drop_duplicates()
df = df.dropna(subset="Global_active_power")
hourly = df.set_index("datetime")[cols].resample("1h").mean().dropna().reset_index()
hourly.columns=[c.lower()for c in hourly.columns]
hourly.to_csv("hourly_power",index=False)
print(hourly.shape)
print(hourly.head())