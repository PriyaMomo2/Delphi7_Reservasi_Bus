unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, jpeg,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox8: TGroupBox;
    Edit3: TEdit;
    DBGrid3: TDBGrid;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  lokasi, lokasi1, lokasi2, lokasi3: string;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
form1.Show;
form2.Hide;
form3.Hide;
form4.Hide;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.Hide;
form2.Show;
form3.Hide;
form4.Hide;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Show;
form4.Hide;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Hide;
form4.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Hide;
form4.Hide;
form5.Show;
end;

procedure TForm1.DBGrid3CellClick(Column: TColumn);
begin
with DBGrid3 do
begin
  label5.Caption:=DBGrid3.DataSource.DataSet['plat'];
  label6.Caption:=DBGrid3.DataSource.DataSet['mesin'];
  label7.Caption:=DBGrid3.DataSource.DataSet['jumlah_kursi'];
  label8.Caption:=DBGrid3.DataSource.DataSet['status'];
  lokasi:=DBGrid3.DataSource.DataSet['1'];
  lokasi1:=DBGrid3.DataSource.DataSet['2'];
  lokasi2:=DBGrid3.DataSource.DataSet['3'];
  lokasi3:=DBGrid3.DataSource.DataSet['4'];
 end;
Image2.Picture.LoadFromFile(lokasi);
Image3.Picture.LoadFromFile(lokasi1);
Image4.Picture.LoadFromFile(lokasi2);
Image5.Picture.LoadFromFile(lokasi3);
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
ADOTable1.Locate('plat',Edit3.Text,[LoPartialKey]);
ADOTable1.Locate('mesin',Edit3.Text,[LoPartialKey]);
ADOTable1.Locate('jumlah_kursi',Edit3.Text,[LoPartialKey]);
ADOTable1.Locate('status',Edit3.Text,[LoPartialKey]);
end;

end.
