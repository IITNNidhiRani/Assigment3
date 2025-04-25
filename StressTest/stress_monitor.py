import psutil, os, time

def stress():
    while True:
        _ = [x**2 for x in range(100000)]

while True:
    cpu = psutil.cpu_percent(interval=2)
    print(f"CPU Usage: {cpu}%")
    if cpu > 75:
        print("High usage detected. Triggering cloud scaling...")
        os.system("./scale_to_gcp.sh")
        break
    else:
        print("Running stress test locally...")
        stress()

