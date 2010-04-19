using System;
using System.Drawing;
using System.Windows.Forms;
using SULibrary;

public class SUSchematicRepresentation : IGraphicalPlugin
{

	#region IGraphicalPlugin Members

	public void Initialize(Parameters inputparams)
	{
		this.InputParameters = inputparams;

		SchematicRepresentationForm = new Form();
		SchematicRepresentationForm.Text = "Схематическое представление СУ";
		SchematicRepresentationForm.WindowState = FormWindowState.Maximized;
		SchematicRepresentationForm.BackColor = Color.White;
		SchematicRepresentationForm.Paint += Painter;
		SchematicRepresentationForm.Resize += SchematicRepresentationForm_Resize;
	}

	public string[] InputParams
	{
		get
		{
			string[] inparams = new string[7] { "tpslt", "dslc", "vshc", "lysu", "hysu", "drlp", "srsp" };
			return inparams;
		}
	}

	public string Name
	{
		get { return "SchematicRepresentation"; }
	}

	public Form WinForm
	{
		get { return this.SchematicRepresentationForm; }
	}

	#endregion

	private Form SchematicRepresentationForm;

	private Parameters InputParameters;

	private void Painter(object sender, PaintEventArgs args)
	{
		// текущее положение струга {м}
		double tpslt = (double)this.InputParameters["tpslt"].Value;
		// длина струга {м}
		double dslc = (double)this.InputParameters["dslc"].Value;
		// высота струга {м}
		double vshc = (double)this.InputParameters["vshc"].Value;
		// длина СУ {м}
		double lysu = (double)this.InputParameters["lysu"].Value;
		// высота плиты {м}
		double hysu = (double)this.InputParameters["hysu"].Value;
		// длина резца {м}
		double drlp = (double)this.InputParameters["drlp"].Value;
		// сторона резца {м}
		double srsp = (double)this.InputParameters["srsp"].Value;

		Form frm = (Form)sender;
		SizeF formsize = frm.ClientSize;
		Pen pn = new Pen(Color.Black, 0);

		// Считаем коэффициент
		float tempX = (formsize.Width - 100f) / ((float)lysu - (float)tpslt + (float)drlp);
		float tempY = (formsize.Height - 100f) / ((float)hysu + (float)vshc);

		float multiplier;
		if (tempX < tempY)
			multiplier = tempX;
		else
			multiplier = tempY;

		PointF LeftTopPoint = new PointF();

		LeftTopPoint.X = formsize.Width / 2f - ((float)lysu - (float)tpslt + (float)drlp) / 2f * multiplier;
		LeftTopPoint.Y = formsize.Height / 2f + ((float)hysu + (float)vshc) / 2f * multiplier;
		LeftTopPoint.Y -= (float)hysu * multiplier;

		SizeF Dimensions = new SizeF((float)lysu * multiplier, (float)hysu * multiplier);
		RectangleF Foundation = new RectangleF(LeftTopPoint, Dimensions);
		args.Graphics.DrawRectangle(pn, Rectangle.Round(Foundation));

		string str = lysu.ToString() + " м";
		LeftTopPoint.X = Foundation.X + Foundation.Width / 2f;
		LeftTopPoint.Y = Foundation.Bottom;
		args.Graphics.DrawString(str, SystemFonts.DefaultFont, SystemBrushes.WindowText, LeftTopPoint);
		str = hysu.ToString() + " м";
		LeftTopPoint.X = Foundation.X;
		LeftTopPoint.Y = Foundation.Bottom - Foundation.Height / 2f - SystemFonts.DefaultFont.GetHeight(args.Graphics) / 2f;
		args.Graphics.DrawString(str, SystemFonts.DefaultFont, SystemBrushes.WindowText, LeftTopPoint);


		LeftTopPoint.X = Foundation.Right - ((float)tpslt + (float)dslc) * multiplier;
		LeftTopPoint.Y = Foundation.Top - (float)vshc * multiplier;

		Dimensions = new SizeF((float)dslc * multiplier, (float)vshc * multiplier);
		RectangleF Plow = new RectangleF(LeftTopPoint, Dimensions);

		args.Graphics.DrawRectangle(pn, Rectangle.Round(Plow));

		str = dslc.ToString() + " м";
		LeftTopPoint.X = Plow.X + Plow.Width / 2f;
		LeftTopPoint.Y = Plow.Top - SystemFonts.DefaultFont.GetHeight(args.Graphics);
		args.Graphics.DrawString(str, SystemFonts.DefaultFont, SystemBrushes.WindowText, LeftTopPoint);
		str = vshc.ToString() + " м";
		LeftTopPoint.X = Plow.X;
		LeftTopPoint.Y = Plow.Bottom - Plow.Height / 2f - SystemFonts.DefaultFont.GetHeight(args.Graphics) / 2f;
		args.Graphics.DrawString(str, SystemFonts.DefaultFont, SystemBrushes.WindowText, LeftTopPoint);


		LeftTopPoint.X = Plow.Right;
		LeftTopPoint.Y = Plow.Y + (Plow.Height / 2f - (float)srsp / 2f * multiplier) - Plow.Height / 4f;

		Dimensions = new SizeF((float)drlp * multiplier, (float)srsp * multiplier);
		RectangleF CuttingTool_1 = new RectangleF(LeftTopPoint, Dimensions);
		RectangleF CuttingTool_2 = new RectangleF(CuttingTool_1.Location, CuttingTool_1.Size);
		CuttingTool_2.Offset(0f, Plow.Height / 2f);

		args.Graphics.DrawRectangle(pn, Rectangle.Round(CuttingTool_1));
		args.Graphics.DrawRectangle(pn, Rectangle.Round(CuttingTool_2));

		str = drlp.ToString() + " м";
		LeftTopPoint.X = CuttingTool_1.X;
		LeftTopPoint.Y = CuttingTool_1.Bottom;
		args.Graphics.DrawString(str, SystemFonts.DefaultFont, SystemBrushes.WindowText, LeftTopPoint);
		str = srsp.ToString() + " м";
		LeftTopPoint.X = CuttingTool_1.Right;
		LeftTopPoint.Y = CuttingTool_1.Bottom - CuttingTool_1.Height / 2f - SystemFonts.DefaultFont.GetHeight(args.Graphics) / 2f;
		args.Graphics.DrawString(str, SystemFonts.DefaultFont, SystemBrushes.WindowText, LeftTopPoint);
	}

	private void SchematicRepresentationForm_Resize(object sender, EventArgs e)
	{
		Form frm = (Form)sender;
		frm.Refresh();
	}

}
