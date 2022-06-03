function varargout = kalkulator_casio(varargin)
% KALKULATOR_CASIO MATLAB code for kalkulator_casio.fig
%      KALKULATOR_CASIO, by itself, creates a new KALKULATOR_CASIO or raises the existing
%      singleton*.
%
%      H = KALKULATOR_CASIO returns the handle to a new KALKULATOR_CASIO or the handle to
%      the existing singleton*.
%
%      KALKULATOR_CASIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KALKULATOR_CASIO.M with the given input arguments.
%
%      KALKULATOR_CASIO('Property','Value',...) creates a new KALKULATOR_CASIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kalkulator_casio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kalkulator_casio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kalkulator_casio

% Last Modified by GUIDE v2.5 14-Oct-2020 16:12:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kalkulator_casio_OpeningFcn, ...
                   'gui_OutputFcn',  @kalkulator_casio_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before kalkulator_casio is made visible.
function kalkulator_casio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kalkulator_casio (see VARARGIN)

% Choose default command line output for kalkulator_casio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kalkulator_casio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kalkulator_casio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_tujuh.
function pushbutton_tujuh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_tujuh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'7'));

% --- Executes on button press in pushbutton_delapan.
function pushbutton_delapan_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_delapan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'8'));

% --- Executes on button press in pushbutton_sembilan.
function pushbutton_sembilan_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sembilan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'9'));

% --- Executes on button press in pushbutton_empat.
function pushbutton_empat_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_empat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'4'));

% --- Executes on button press in pushbutton_lima.
function pushbutton_lima_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_lima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'5'));

% --- Executes on button press in pushbutton_enam.
function pushbutton_enam_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_enam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'7'));

% --- Executes on button press in pushbutton_satu.
function pushbutton_satu_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_satu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'1'));

% --- Executes on button press in pushbutton_dua.
function pushbutton_dua_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_dua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'2'));

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'9'));

% --- Executes on button press in pushbutton_nol.
function pushbutton_nol_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_nol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'0'));

% --- Executes on button press in pixel.
function pixel_Callback(hObject, eventdata, handles)
% hObject    handle to pixel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'.'));

% --- Executes on button press in EXP.
function EXP_Callback(hObject, eventdata, handles)
% hObject    handle to EXP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
E='*10^';
set(handles.edit1,'string',strcat(a,'E'));

% --- Executes on button press in del.
function del_Callback(hObject, eventdata, handles)
% hObject    handle to del (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
a=a(:,1:length(a)-1);
set(handles.edit1,'string',a);

% --- Executes on button press in ac.
function ac_Callback(hObject, eventdata, handles)
% hObject    handle to ac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string','');
set(handles.text1,'string','0.');


% --- Executes on button press in multiple.
function multiple_Callback(hObject, eventdata, handles)
% hObject    handle to multiple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'*'));

% --- Executes on button press in divisor.
function divisor_Callback(hObject, eventdata, handles)
% hObject    handle to divisor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'/'));

% --- Executes on button press in pluse.
function pluse_Callback(hObject, eventdata, handles)
% hObject    handle to pluse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'+'));

% --- Executes on button press in minus.
function minus_Callback(hObject, eventdata, handles)
% hObject    handle to minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.edit1,'string',strcat(a,'-'));

% --- Executes on button press in Ans.
function Ans_Callback(hObject, eventdata, handles)
% hObject    handle to Ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
Ans=get(handles.text1,'string');
set(handles.edit1,'string',strcat(a,Ans));

% --- Executes on button press in equal.
function equal_Callback(hObject, eventdata, handles)
% hObject    handle to equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'string');
set(handles.text1,'string',str2num(a));


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
