extensions = input("Write the File Name:")
extensions = extensions.strip()
extensions = extensions.lower()
mediatypes = extensions[-4:]

if mediatypes == ".gif":
    print("image/gif")
elif mediatypes == ".jpg":
    print("image/jpg")
elif mediatypes == "jpeg":
    print("image/jpeg")
elif mediatypes == ".png":
    print("image/png")
elif mediatypes == ".pdf":
    print("application/pdf")
elif mediatypes == ".txt":
    print("text/plain")
elif mediatypes == ".zip":
    print("application/zip")
else:
    print("Media Type Not Fould")
