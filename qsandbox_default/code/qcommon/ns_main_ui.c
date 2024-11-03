// Массив с названиями функций
const char *function_list[MAX_FUNCS] = {
    "print",
    "command",
    "createThread",
    "deleteThread",
    "getCvar",
    "setCvar",
    "getVariable",
    "setVariable",
    "NSGui_Init",
    "NSGui_Reset",
    "NSGui_Load",
    NULL
};

// Список типов аргументов для каждой функции
const char *function_arg_types[MAX_FUNCS][MAX_ARGS] = {
    {"char"},                                       // print
    {"char", "char"},                               // command
    {"char", "char", "int"},                        // createThread
    {"char"},                                       // deleteThread
    {"char"},                                       // getCvar
    {"char", "char"},                               // setCvar
    {"char"},                                       // getVariable
    {"char", "char"},                               // setVariable
    {0},                                            // NSGui_Init
    {0},                                            // NSGui_Reset
    {0},                                            // NSGui_Load
    {NULL}                                          // NULL
};

// Функция для поиска индекса функции по её названию
int funcforindex(const char *name) {
    int i;
    for (i = 0; i < MAX_FUNCS; i++) {
        if (strcmp(function_list[i], name) == 0) {
            return i; // Возвращаем индекс, если найдено совпадение
        }
    }
    return -1; // Если функция не найдена, возвращаем -1
}

char stringArgsBuffer[MAX_ARGS][MAX_ARG_LENGTH]; // Для хранения строковых аргументов

void callfunc(Variable *var, const char *name, const char *operation, const char *args) {
    VarValue result;
    qboolean hasReturnValue = qfalse;
    int argCount;
    char cleanedArgs[MAX_ARG_LENGTH]; // Для хранения очищенных аргументов
    int i;

    //Com_Printf("Noire.Script Debug: %s() args %s\n", name, args);

    // Удаляем внешние скобки и копируем в статический массив
    strncpy(cleanedArgs, removeOuterBrackets(args), MAX_ARG_LENGTH - 1);
    cleanedArgs[MAX_ARG_LENGTH - 1] = '\0'; // Завершаем строку

    // Разделяем аргументы
    argCount = splitArgs(cleanedArgs, stringArgsBuffer);

    for (i = 0; i < argCount; i++) {
        const char* expectedType = function_arg_types[funcforindex(name)][i];
        // Применяем NS_Exp к int и float, и NS_Text к char
        if (strcmp(expectedType, "int") == 0) {
            ns_args[i].i = (int)NS_Exp(stringArgsBuffer[i]);
        } else if (strcmp(expectedType, "float") == 0) {
            ns_args[i].f = NS_Exp(stringArgsBuffer[i]);
        } else {
            NS_Text(stringArgsBuffer[i], ns_args[i].c, sizeof(ns_args[i].c));
        }
    }

    if (strcmp(name, "print") == 0 && argCount >= 1) {
        Com_Printf("%s\n", ns_args[0].c);
    }

    else if (strcmp(name, "command") == 0 && argCount >= 2) {
        int exec_mode = (!strcmp(ns_args[0].c, "EXEC_NOW")) ? EXEC_NOW :
                        (!strcmp(ns_args[0].c, "EXEC_INSERT")) ? EXEC_INSERT : EXEC_APPEND;
        
        trap_Cmd_ExecuteText(exec_mode, ns_args[1].c);
    }

    else if (strcmp(name, "createThread") == 0 && argCount >= 3) {
        NS_OpenScript(ns_args[0].c, ns_args[1].c, ns_args[2].i);
    }

    else if (strcmp(name, "deleteThread") == 0 && argCount >= 1) {
        RemoveScriptThread(ns_args[0].c);
    }

    else if (strcmp(name, "getCvar") == 0 && argCount >= 1) {
        NS_getCvar(&result, var->type, ns_args[0].c);
        hasReturnValue = qtrue;
    }

    else if (strcmp(name, "setCvar") == 0 && argCount >= 2) {
        NS_setCvar(ns_args[0].c, ns_args[1].c);
    }

    else if (strcmp(name, "getVariable") == 0 && argCount >= 1) {
        NS_getCvar(&result, var->type, ns_args[0].c);
        hasReturnValue = qtrue;
    }

    else if (strcmp(name, "setVariable") == 0 && argCount >= 2) {
        NS_setCvar(ns_args[0].c, ns_args[1].c);
    }

    else if (strcmp(name, "NSGui_Init") == 0 && argCount >= 0) {
        NSGUI_Init();
    }

    else if (strcmp(name, "NSGui_Reset") == 0 && argCount >= 0) {
        NSGUI_Clear();
    }

    else if (strcmp(name, "NSGui_Load") == 0 && argCount >= 0) {
        NSGUI_Load();
    }

    else {
        Com_Printf("Noire.Script Error: %s - incorrect number of arguments.\n", name);
    }

    if (hasReturnValue) {
        set_variable(var, result, operation);
    }
}