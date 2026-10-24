import time, os
def detect_usb():
    while True:
        result = os.popen("lsusb").read()
        if "ID" in result:
            print("[NetSecurePro] USB détectée")
            os.system("bash cloudflare_start.sh &")
            os.system("termux-open-url http://127.0.0.1:8000")
            break
        time.sleep(2)
detect_usb()
