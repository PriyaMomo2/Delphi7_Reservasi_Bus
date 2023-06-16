unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, jpeg, ExtCtrls, DB, ADODB;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    DateTimePicker1: TDateTimePicker;
    Memo2: TMemo;
    ComboBox2: TComboBox;
    Button6: TButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1, Unit2, Unit4, Unit5;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
form1.Show;
form2.Hide;
form3.Hide;
form4.Hide;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form1.Hide;
form2.Show;
form3.Hide;
form4.Hide;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Show;
form4.Hide;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Hide;
form4.Show;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
form1.Hide;
form2.Hide;
form3.Hide;
form4.Hide;
form5.Show;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  try
    with ADOTable1 do
      begin
        Active:=false;
        TableName:='tb_pemesanan';
        Active:=true;
        append;
        ADOTable1['nama']:=edit2.Text;
        ADOTable1['tujuan']:=ComboBox2.Text;
        ADOTable1['berangkat']:=DateTimePicker1.Time;
        ADOTable1['titik jemput']:=edit4.Text;
        ADOTable1['jumlah penumpang']:=edit5.Text;
        ADOTable1['kontak']:=edit6.Text;
        ADOTable1['pesan']:=Memo2.Text;
        ADOTable1['status']:=Label1.Caption;
        post;
      end;
    ShowMessage('Berhasil disimpan');
    ADOTable1.Close;
    ADOTable1.Open;
    Edit2.Text := '';
    ComboBox2.Text:='         --  Pilih Tujuan --';
    Edit4.Text := '';
    Edit5.Text := '';
    Edit6.Text := '';
    Memo2.Text :='Pesan';
    except
    ShowMessage('Gagal disimpan');
  end;
end;

end.
