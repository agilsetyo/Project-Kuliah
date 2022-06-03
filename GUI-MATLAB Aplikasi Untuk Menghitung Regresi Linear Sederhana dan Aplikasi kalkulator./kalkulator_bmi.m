function varargout = kalkulator_bmi(varargin)
% KALKULATOR_BMI MATLAB code for kalkulator_bmi.fig
%      KALKULATOR_BMI, by itself, creates a new KALKULATOR_BMI or raises the existing
%      singleton*.
%      (AGIL SETYO ANGGORO 24050118140083)
%      H = KALKULATOR_BMI returns the handle to a new KALKULATOR_BMI or the handle to
%      the existing singleton*.
%
%      KALKULATOR_BMI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KALKULATOR_BMI.M with the given input arguments.
%
%      KALKULATOR_BMI('Property','Value',...) creates a new KALKULATOR_BMI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kalkulator_bmi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kalkulator_bmi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kalkulator_bmi

% Last Modified by GUIDE v2.5 14-Oct-2020 20:32:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kalkulator_bmi_OpeningFcn, ...
                   'gui_OutputFcn',  @kalkulator_bmi_OutputFcn, ...
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


% --- Executes just before kalkulator_bmi is made visible.
function kalkulator_bmi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kalkulator_bmi (see VARARGIN)

% Choose default command line output for kalkulator_bmi
handles.output = hObject;
handles.metric = 0;
handles.wu = 'lb';
handles.hu = 'in';
handles.name = '';
handles.age = '';
handles.bmi = 0;
handles.weight = '';
handles.height = '';
handles.result = '';
handles.condition = ''; 

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kalkulator_bmi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kalkulator_bmi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calculate_button.
function calculate_button_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.metric
    w = handles.weight;
    h = handles.height/100;
else
    w = handles.weight/2.2046;
    h = handles.height/0.3937;
end

bmi = w/h^2;

if bmi < 18.5
    s = ' Underweight';
    set(handles.axes1);
    imshow('underweight.jpg');
elseif 18.5 <= bmi & bmi < 25
    s = ' Normal';
    set(handles.axes1);
    imshow('normal.jpg');
elseif 25 <= bmi & bmi < 30
    s = ' Overweight';
    set(handles.axes1);
    imshow('overweight.jpg');
else
    s = ' Obese';
    set(handles.axes1);
    imshow('obese.jpg');
end   

bmis = [num2str(bmi, 3) s]; 
set(handles.result_text, 'String', bmis);
handles.result = bmi;
handles.condition = s;
guidata(hObject,handles); 

% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.name_text, 'String', '')
handles.name = '';
set(handles.age_text, 'String', '')
handles.age = '';
set(handles.weight_text, 'String', '')
handles.weight = 0;
set(handles.height_text, 'String', '')
handles.height = 0;
set(handles.result_text, 'String', '')
handles.result = 0;
handles.condition = '';
set(handles.axes1)
imshow('');

% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


function result_text_Callback(hObject, eventdata, handles)
% hObject    handle to result_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_text as text
%        str2double(get(hObject,'String')) returns contents of result_text as a double


% --- Executes during object creation, after setting all properties.
function result_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function height_text_Callback(hObject, eventdata, handles)
% hObject    handle to height_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of height_text as text
%        str2double(get(hObject,'String')) returns contents of height_text as a double
num = str2double(get(hObject,'String'));
if isnan(num)
    set(hObject,'String', 0);
end
handles.height = num;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function height_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to height_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function weight_text_Callback(hObject, eventdata, handles)
% hObject    handle to weight_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of weight_text as text
%        str2double(get(hObject,'String')) returns contents of weight_text as a double
num = str2double(get(hObject,'String'));
if isnan(num)
    set(hObject,'String', 0);
end
handles.weight = num;
guidata(hObject, handles) 

% --- Executes during object creation, after setting all properties.
function weight_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weight_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name_text_Callback(hObject, eventdata, handles)
% hObject    handle to name_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name_text as text
%        str2double(get(hObject,'String')) returns contents of name_text as a double
handles.name = get(hObject,'String');
guidata(hObject, handles) 

% --- Executes during object creation, after setting all properties.
function name_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function age_text_Callback(hObject, eventdata, handles)
% hObject    handle to age_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of age_text as text
%        str2double(get(hObject,'String')) returns contents of age_text as a double
handles.age = get(hObject,'String');
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function age_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to age_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in metric_radio.
function metric_radio_Callback(hObject, eventdata, handles)
% hObject    handle to metric_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of metric_radio
handles.metric = get(hObject,'Value');
set(handles.weight_label, 'String', 'Weight (kg):')
set(handles.height_label, 'String', 'Height (cm):')
set(handles.anglo_radio, 'Value', 0)
handles.anglo = 0;
handles.wu = 'kg';
handles.hu = 'cm';
guidata(hObject, handles)

% --- Executes on button press in anglo_radio.
function anglo_radio_Callback(hObject, eventdata, handles)
% hObject    handle to anglo_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of anglo_radio
handles.anglo = get(hObject,'Value');
set(handles.weight_label, 'String', 'Weight (lb):')
set(handles.height_label, 'String', 'Height (in):')
set(handles.metric_radio, 'Value', 0)
handles.metric = 0;
handles.wu = 'lb';
handles.hu = 'in';
guidata(hObject, handles)
