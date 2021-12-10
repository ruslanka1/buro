unit GlbDecls;

interface
uses Windows;

procedure InfoMess(const S:string);
procedure ErrMess(const S:string);
function  Quest(const S,Capt:string; Opt:integer=MB_DEFBUTTON2):boolean;
procedure ConnErrMess;

implementation
uses Forms;

function MessBox(const Capt, Mess:string;Opt:integer):integer;
  begin
  Result:=Application.MessageBox(PChar(Mess), PChar(Capt), Opt);
  end;

procedure InfoMess(const S:string);
  begin
  MessBox('����������',S,MB_TASKMODAL+MB_ICONINFORMATION);
  end;

procedure ErrMess(const S:string);
  begin
  MessBox('������',S,MB_TASKMODAL+MB_ICONERROR);
  end;

procedure ConnErrMess;
  begin
  ErrMess('������ �����!');
  end;

function  Quest(const S,Capt:string; Opt:integer=MB_DEFBUTTON2):boolean;
  begin
  Result:=MessBox(Capt,S,(MB_TASKMODAL+MB_ICONQUESTION+MB_YESNO) or Opt)=ID_YES;
  end;

end.
