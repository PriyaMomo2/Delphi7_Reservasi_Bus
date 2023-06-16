unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, ExtDlgs, DB,
  ADODB;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Button7: TButton;
    ComboBox1: TComboBox;
    Button8: TButton;
    Button9: TButton;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    ADOTable2: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  lokasi, lokasi1, lokasi2, lokasi3: string;

implementation

uses Unit7, Unit8, Unit9, Unit1;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
form6.Show;
form7.Hide;
form8.Hide;
form9.Hide;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Akan Keluar dari Sistem?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    Form1.Close;
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
form6.Hide;
form7.Show;
form8.Hide;
form9.Hide;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Show;
form9.Hide;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Hide;
form9.Show;
end;

procedure TForm6.Button6Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Akan Keluar dari Sistem?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    Form1.Close;
  end;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  lokasi:=OpenPictureDialog1.FileName;
  Image2.Picture.LoadFromFile(lokasi);
end;

procedure TForm6.Image3Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  lokasi1:=OpenPictureDialog1.FileName;
  Image3.Picture.LoadFromFile(lokasi1);
end;

procedure TForm6.Image5Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  lokasi2:=OpenPictureDialog1.FileName;
  Image5.Picture.LoadFromFile(lokasi2);
end;

procedure TForm6.Image4Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
  lokasi3:=OpenPictureDialog1.FileName;
  Image4.Picture.LoadFromFile(lokasi3);
end;

procedure TForm6.Edit1Change(Sender: TObject);
begin
ADOTable1.Locate('plat',Edit1.Text,[LoPartialKey]);
ADOTable1.Locate('mesin',Edit1.Text,[LoPartialKey]);
ADOTable1.Locate('jumlah_kursi',Edit1.Text,[LoPartialKey]);
ADOTable1.Locate('status',Edit1.Text,[LoPartialKey]);
end;

procedure TForm6.DBGrid2CellClick(Column: TColumn);
begin
with DBGrid2 do
begin
  edit2.DisableAlign;
  edit2.Text:=DBGrid2.DataSource.DataSet['plat'];
  edit6.Text:=DBGrid2.DataSource.DataSet['mesin'];
  edit4.Text:=DBGrid2.DataSource.DataSet['jumlah_kursi'];
  ComboBox1.Text:=DBGrid2.DataSource.DataSet['status'];
  lokasi:=DBGrid2.DataSource.DataSet['1'];
  lokasi1:=DBGrid2.DataSource.DataSet['2'];
  lokasi2:=DBGrid2.DataSource.DataSet['3'];
  lokasi3:=DBGrid2.DataSource.DataSet['4'];
 end;
Image2.Picture.LoadFromFile(lokasi);
Image3.Picture.LoadFromFile(lokasi1);
Image4.Picture.LoadFromFile(lokasi2);
Image5.Picture.LoadFromFile(lokasi3);
end;

procedure TForm6.Button9Click(Sender: TObject);
begin
  try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='tb_bus';
        Active:=true;
        append;
        ADOTable1['plat']:=edit2.Text;
        ADOTable1['mesin']:=edit6.Text;
        ADOTable1['jumlah_kursi']:=edit4.Text;
        ADOTable1['status']:=ComboBox1.Text;
        ADOTable1['1']:=lokasi;
        ADOTable1['2']:=lokasi1;
        ADOTable1['3']:=lokasi2;
        ADOTable1['4']:=lokasi3;
        post;
      end;
    ShowMessage('Berhasil disimpan');
    ADOTable2.Close;
    ADOTable2.Open;
    Edit2.Text := '';
    Edit4.Text := '';
    Edit6.Text := '';
    ComboBox1.Text :='  -- Pilih Status Bus --';
  except
    ShowMessage('Gagal disimpan');
  end;
end;

procedure TForm6.Button8Click(Sender: TObject);
begin
try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='tb_bus';
        Active:=true;
        Edit;
        ADOTable1['plat']:=edit2.Text;
        ADOTable1['mesin']:=edit6.Text;
        ADOTable1['jumlah_kursi']:=edit4.Text;
        ADOTable1['status']:=ComboBox1.Text;
        ADOTable1['1']:=lokasi;
        ADOTable1['2']:=lokasi1;
        ADOTable1['3']:=lokasi2;
        ADOTable1['4']:=lokasi3;
        post;
      end;
    ShowMessage('Berhasil diupdate');
    ADOTable2.Close;
    ADOTable2.Open;
    Edit2.Text := '';
    Edit4.Text := '';
    Edit6.Text := '';
    ComboBox1.Text :='  -- Pilih Status Bus --';
  except
    ShowMessage('Gagal diupdate');
  end;
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Ingin Menghapus?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    AdoTable1.delete;
  end;
end;

end.
