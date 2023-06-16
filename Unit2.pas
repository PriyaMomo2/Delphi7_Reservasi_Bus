unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, jpeg, ExtCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Memo1: TMemo;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
form1.Show;
form2.Hide;
form3.Hide;
form4.Hide;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form1.Hide;
form2.Show;
form3.Hide;
form4.Hide;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Show;
form4.Hide;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Hide;
form4.Show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Hide;
form4.Hide;
form5.Show;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
with DBGrid1 do
begin
  label18.Caption:=DBGrid1.DataSource.DataSet['tujuan'];
  label16.Caption:=DBGrid1.DataSource.DataSet['harga'];
  Memo1.Text:=DBGrid1.DataSource.DataSet['fasilitas'];
 end;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
ADOTable1.Locate('tujuan',Edit1.Text,[LoPartialKey]);
ADOTable1.Locate('fasilitas',Edit1.Text,[LoPartialKey]);
end;

end.
