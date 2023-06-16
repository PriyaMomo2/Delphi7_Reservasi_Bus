unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, ComCtrls, DB, ADODB;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit8: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Memo1: TMemo;
    Edit7: TEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit6, Unit8, Unit9, Unit1;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
form6.Show;
form7.Hide;
form8.Hide;
form9.Hide;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
form6.Hide;
form7.Show;
form8.Hide;
form9.Hide;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Show;
form9.Hide;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Hide;
form9.Show;
end;

procedure TForm7.Button5Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Akan Keluar dari Sistem?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    Form1.Close;
  end;
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
ADOTable1.Locate('tujuan',Edit3.Text,[LoPartialKey]);
end;

procedure TForm7.Button12Click(Sender: TObject);
begin
try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='tb_harga';
        Active:=true;
        append;
        ADOTable1['tujuan']:=edit7.Text;
        ADOTable1['harga']:=edit8.Text;
        ADOTable1['fasilitas']:=Memo1.Text;
        post;
      end;
    ShowMessage('Berhasil disimpan');
    ADOTable1.Close;
    ADOTable1.Open;
    Edit7.Text := '';
    Edit8.Text := '';
    Memo1.Text :='Fasilitas';
  except
    ShowMessage('Gagal disimpan');
  end;
end;

procedure TForm7.Button11Click(Sender: TObject);
begin
try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='tb_harga';
        Active:=true;
        Edit;
        ADOTable1['tujuan']:=edit7.Text;
        ADOTable1['harga']:=edit8.Text;
        ADOTable1['fasilitas']:=Memo1.Text;
        post;
      end;
    ShowMessage('Berhasil disimpan');
    ADOTable1.Close;
    ADOTable1.Open;
    Edit7.Text := '';
    Edit8.Text := '';
    Memo1.Text :='Fasilitas';
  except
    ShowMessage('Gagal disimpan');
  end;
end;

procedure TForm7.Button10Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Ingin Menghapus?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    AdoTable1.delete;
  end;
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
with DBGrid1 do
begin
  edit7.DisableAlign;
  edit7.Text:=DBGrid1.DataSource.DataSet['tujuan'];
  edit8.Text:=DBGrid1.DataSource.DataSet['harga'];
  Memo1.Text:=DBGrid1.DataSource.DataSet['fasilitas'];
 end;
end;

end.
