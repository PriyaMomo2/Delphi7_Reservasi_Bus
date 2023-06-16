unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm9 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button6: TButton;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    GroupBox9: TGroupBox;
    DBGrid4: TDBGrid;
    Edit26: TEdit;
    GroupBox7: TGroupBox;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DateTimePicker1: TDateTimePicker;
    Memo2: TMemo;
    Button16: TButton;
    Button18: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button4: TButton;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure Edit26Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit6, Unit7, Unit8, Unit1;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
form6.Show;
form7.Hide;
form8.Hide;
form9.Hide;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
form6.Hide;
form7.Show;
form8.Hide;
form9.Hide;
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Show;
form9.Hide;
end;

procedure TForm9.Button4Click(Sender: TObject);
begin
form6.Hide;
form7.Hide;
form8.Hide;
form9.Show;
end;

procedure TForm9.Button6Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Akan Keluar dari Sistem?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    Form1.Close;
  end;
end;

procedure TForm9.Button16Click(Sender: TObject);
begin
if MessageDlg('Anda Yakin Ingin Menghapus?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    AdoTable2.delete;
  end;
end;

procedure TForm9.Button18Click(Sender: TObject);
begin
try
    with ADOTable2 do
      begin
        Active:=false;
        TableName:='tb_pemesanan';
        Active:=true;
        Edit;
        ADOTable2['berangkat']:=DateTimePicker1.Time;
        ADOTable2['status']:=ComboBox1.Text;
        ADOTable2['pesan']:=Memo2.Text;
        post;
      end;
    ShowMessage('Berhasil disimpan');
    ADOTable2.Close;
    ADOTable2.Open;
    Memo2.Text :='Pesan';
    ComboBox1.Text:='  -- Pilih Status Pembayaran --';
  except
    ShowMessage('Gagal disimpan');
  end;
end;

procedure TForm9.DBGrid4CellClick(Column: TColumn);
begin
with DBGrid4 do
  begin
  label30.Caption:=DBGrid4.DataSource.DataSet['nama'];
  label31.Caption:=DBGrid4.DataSource.DataSet['tujuan'];
  DateTimePicker1.Time:=DBGrid4.DataSource.DataSet['berangkat'];
  label33.Caption:=DBGrid4.DataSource.DataSet['titik jemput'];
  label32.Caption:=DBGrid4.DataSource.DataSet['jumlah penumpang'];
  label34.Caption:=DBGrid4.DataSource.DataSet['kontak'];
  Memo2.Text:=DBGrid4.DataSource.DataSet['pesan'];
  end;
end;

procedure TForm9.Edit26Change(Sender: TObject);
begin
ADOTable2.Locate('nama',Edit26.Text,[LoPartialKey]);
ADOTable2.Locate('tujuna',Edit26.Text,[LoPartialKey]);
ADOTable2.Locate('titik jemput',Edit26.Text,[LoPartialKey]);
ADOTable2.Locate('kontak',Edit26.Text,[LoPartialKey]);
ADOTable2.Locate('status',Edit26.Text,[LoPartialKey]);
end;

end.
