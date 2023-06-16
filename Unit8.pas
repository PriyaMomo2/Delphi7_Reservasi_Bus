unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, DB, ADODB;

type
  TForm8 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Edit11: TEdit;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit15: TEdit;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    Edit14: TEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit6, Unit7, Unit9, Unit1;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
form6.Show;
form7.Hide;
form8.Hide;
form9.Hide;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
form6.Hide;
form7.Show;
form8.Hide;
form9.Hide;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Show;
form9.Hide;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Hide;
form9.Show;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Akan Keluar dari Sistem?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    Form1.Close;
  end;
end;

procedure TForm8.DBGrid3CellClick(Column: TColumn);
begin
with DBGrid3 do
begin
  edit13.DisableAlign;
  edit13.Text:=DBGrid3.DataSource.DataSet['nama'];
  edit11.Text:=DBGrid3.DataSource.DataSet['kontak'];
  edit12.Text:=DBGrid3.DataSource.DataSet['user'];
  edit15.Text:=DBGrid3.DataSource.DataSet['pass'];
 end;
end;

procedure TForm8.Button15Click(Sender: TObject);
begin
try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='t_user';
        Active:=true;
        append;
        ADOTable1['nama']:=edit13.Text;
        ADOTable1['kontak']:=edit11.Text;
        ADOTable1['user']:=edit12.Text;
        ADOTable1['pass']:=edit15.Text;
        post;
      end;
    ShowMessage('Berhasil disimpan');
    ADOTable1.Close;
    ADOTable1.Open;
    Edit13.Text := '';
    Edit11.Text := '';
    Edit12.Text := '';
    Edit15.Text := '';
  except
    ShowMessage('Gagal disimpan');
  end;
end;

procedure TForm8.Button14Click(Sender: TObject);
begin
try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='t_user';
        Active:=true;
        Edit;
        ADOTable1['nama']:=edit13.Text;
        ADOTable1['kontak']:=edit11.Text;
        ADOTable1['user']:=edit12.Text;
        ADOTable1['pass']:=edit15.Text;
        post;
      end;
    ShowMessage('Berhasil diupdate');
    ADOTable1.Close;
    ADOTable1.Open;
    Edit13.Text := '';
    Edit11.Text := '';
    Edit12.Text := '';
    Edit15.Text := '';
  except
    ShowMessage('Gagal diupdate');
  end;
end;

procedure TForm8.Button13Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Ingin Menghapus?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    AdoTable1.delete;
  end;
end;

procedure TForm8.Edit14Change(Sender: TObject);
begin
ADOTable1.Locate('nama',Edit14.Text,[LoPartialKey]);
end;

end.
