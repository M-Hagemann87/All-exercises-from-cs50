from fpdf import FPDF

class PDF(FPDF):
    def header(self):
        name  = input("Name: ")
        self.set_font("helvetica", style="B", size=15)
        self.cell(75)
        self.cell(50, 10, "CS50 Shirtificate", border=1, align="C")
        self.image("shirtificate.png", x=0, y=50)
        self.set_font("Helvetica", size=30)
        self.set_text_color(250)
        self.cell(-50, 250, text=f"{name} took CS50", align="C")


# Instantiation of inherited class
pdf = PDF(orientation="P", unit="mm", format=(210, 297))
pdf.add_page()
pdf.output("out_shirt_pdf.pdf")
