Include irvine32.inc

MAX_BUGS EQU 10
MAX_TASKS EQU 10

.data
	master_title BYTE "OEL ENDED LAB COAL",0dh, 0ah
				 BYTE "FARWA FAISAL, BILAL KHAN, ALIYAN AMJAD, ABUZHAR", 0dh, 0ah
				 BYTE "SUBMITTED TO: MA'AM SIBGHA", 0dh, 0ah,0
	master_menu BYTE "1. Run Bug Tracking System", 0dh, 0ah
				 BYTE "2. Run Agile SPrint Management System", 0dh, 0ah
				 BYTE "3. Rage Quit / Exit", 0dh, 0ah
				 BYTE "Choose from 1 to 3", 0
	err_master_msg BYTE "Invalid input! Please choose a number between 1 and 3.", 0dh, 0ah, 0


	bug_menu BYTE 0dh, 0ah, "MENU", 0dh, 0ah
			 BYTE "1. Register a new bug", 0dh, 0ah
			 BYTE "2. Update a bug severity level", 0dh, 0ah
			 BYTE "3. Search bug bu its id", 0dh, 0ah
			 BYTE "4. Display all bugs", 0dh, 0ah
			 BYTE "5. View avergae resolution time", 0dh, 0ah
			 BYTE "6. view last 5 debging history actions", 0dh, 0ah
			 BYTE "7. test stack exections flow demo", 0dh, 0ah
			 BYTE "8. back to menu", 0dh, 0ah
			 BYTE "Choose from 1 to 8", 0

	bug_count DWORD 0
	bug_ids DWORD MAX_BUGS DUP(0)
	bug_severities DWORD MAX_BUGS DUP(0)
	bug_developers DWORD MAX_BUGS DUP(0)
	bug_statuses DWORD MAX_BUGS DUP(0)
	bug_modules BYTE 160 DUP(0)
	bug_times DWORD MAX_BUGS DUP(0)

	hist_count DWORD 0
	hist_messages BYTE 500 DUP(0)

	p_bug_id BYTE "Enter bug ID (1-10): ", 0
	p_bug_sev BYTE "Enter bug severity (1-3): ", 0
	p_bug_dev BYTE "Enter assigned developer ID (100-999): ", 0
	p_bug_mod BYTE "Enter affected module name: (15 chars, 0 spaces )", 0
	p_bug_status BYTE "Enter bug status (0 for open, 1 for closed):", 0


	err_bug_dup BYTE "Error: Bug ID already exists. Please choose a unique ID.", 0dh, 0ah, 0
	err_bug_sev BYTE "Error: Invalid severity level. Please enter a value between 1 and 3.", 0dh, 0ah, 0
	err_bug_dev BYTE "Error: Invalid developer ID. Please enter a value between 100 and 999.", 0dh, 0ah, 0
	err_bug_mod BYTE "Error: Invalid module name. Please enter a name up to 15 characters with no spaces.", 0dh, 0ah, 0
	err_bug_full BYTE "Error: Maximum number of bugs reached. Cannot register more bugs.", 0dh, 0ah, 0
	err_bug_empty BYTE "Error: No bugs registered yet.", 0dh, 0ah, 0
	err_bug_notfound BYTE "Error: Bug ID not found. Please enter a valid ID.", 0dh, 0ah, 0

	t_header BYTE "ID", 0dh, 0ah
			 BYTE "Severity", 0dh, 0ah
			 BYTE "Developer", 0dh, 0ah
			 BYTE "Status", 0dh, 0ah
			 BYTE "Module", 0dh, 0ah
			 BYTE "Time", 0dh, 0ah, 0
	t_crit BYTE "Critical", 0

    t_maj BYTE "Major", 0
	t_min BYTE "Minor", 0
	t_open BYTE "Open", 0
	t_res BYTE "Resolved", 0
	t_bar BYTE " | ", 0
	t_space BYTE " ", 0

	msg_avg_time BYTE "Average resolution time: ", 0
	msg_hours BYTE " hours", 0dh, 0ah, 0
	msg_no_res BYTE "No resolved bugs to calculate average time.", 0dh, 0ah, 0
	msg_hist_tittle BYTE "Last 5 Debugging Actions:", 0dh, 0ah, 0
	msg_hist_empty BYTE "No debugging history available.", 0dh, 0ah, 0

	bug_action_msg BYTE "Registered Bud Entry Record ", 0
	bug_upd_msg BYTE "Updated Exiting Bug Record ", 0
	bug_src_msg BYTE "Searched Bug Record ", 0

	sprint_menu BYTE 0dh, 0ah, "AGILE SPRINT MANAGEMENT SYSTEM", 0dh, 0ah
				 BYTE "1. Add task to sprint", 0dh, 0ah
				 BYTE "2. calculate dev workload", 0dh, 0ah
				 BYTE "3. view tasks categories and comp percengetage ", 0dh, 0ah
				 BYTE "4. display all", 0dh, 0ah
				 BYTE "5. updtae tasks", 0dh, 0ah
				 BYTE "6. back to menu", 0dh, 0ah
				 BYTE "Choose Option: ", 0

	task_count DWORD 0
	task_ids DWORD MAX_TASKS DUP(0)
	task_devs_ids DWORD MAX_TASKS DUP(0)
	task_Priorities DWORD MAX_TASKS DUP(0)
	task_hours DWORD MAX_TASKS DUP(0)
	task_statuses DWORD MAX_TASKS DUP(0)
	task_sprints DWORD MAX_TASKS DUP(0)

	p_task_id BYTE "Enter task ID (1-10): ", 0
	p_task_dev BYTE "Enter assigned developer ID (100-999): ", 0
	p_task_pri BYTE "Enter task priority (1-3): ", 0
	p_task_hour BYTE "Enter estimated hours to complete: ", 0
	p_task_status  BYTE "Enter task status (0 for open, 1 for closed):", 0
	p_task_sprint BYTE "Enter sprint number (1-5): ", 0

	err_task_dup BYTE "Error: Task ID already exists. Please choose a unique ID.", 0dh, 0ah, 0
	err_task_sprint BYTE "Error: Invalid sprint number. Please enter a value between 1 and 5.", 0dh, 0ah, 0
	err_task_full BYTE "Error: Maximum number of tasks reached. Cannot add more tasks.", 0dh, 0ah, 0
	err_task_empty BYTE "Error: No tasks added yet.", 0dh, 0ah, 0
	err_task_overflow BYTE "Error: Total estimated hours exceed 40 hours per week for a developer.", 0dh, 0ah, 0

	t_task_header BYTE "ID", 0dh, 0ah
				  BYTE "Developer", 0dh, 0ah
				  BYTE "Priority", 0dh, 0ah
				  BYTE "Hours", 0dh, 0ah
				  BYTE "Status", 0dh, 0ah
				  BYTE "Sprint", 0dh, 0ah, 0

	t_high BYTE "High", 0
	t_med BYTE "Medium", 0
	t_low BYTE "Low", 0
	t_pending BYTE "Pending", 0
	t_complete BYTE "Complete", 0


	p_search_dev BYTE "Enter developer ID to search for tasks (100-999): ", 0
	msg_dev_worklod BYTE "Total estimated hours for developer ID ", 0
	msg-analytics BYTE " Sprint analyisis repo" , 0dh, 0ah, 0
	msg_pct_comp BYTE "Percentage of tasks completed: ", 0
	msg_pct_sign BYTE " %", 0dh, 0ah, 0
	msg_cat_counts BYTE "Task category counts - High: ", 0
	msg_cat_pend BYTE " | Pending: ", 0
	msg_cat_comp BYTE " | Complete: ", 0
	msg_newline BYTE 0dh, 0ah, 0

	stack_msg_1 BYTE "[proc1 esp before pushing registers : ]", 0
	stack_msg_2 BYTE "[proc2] nested level reached esp is now .", 0
	stack_msg_3 BYTE "[proc1] returend saftely ", 0

	div_err_guard DWORD 0

	.code
	main PROC
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0


	master_loop:
	call Crdlf
	mov edx, OFFSET master_title
	call WriteString
	mov edx, OFFSET master_menu
	call WriteString

	call ReadInt
	jo master_loop

	cmp eax, 1
	je run_bugs
	cmp eax, 2
	je run_sprint
	cmp eax, 3
	je exit_program

	mov edx, OFFSET err_master_msg
	call WriteString
	jmp master_loop

run_bugs:
	call bug_menu_loop
	jmp master_loop

run_sprint:
	call SprintSystemMenu
	jmp master_loop

exit_program:
	exit

main ENDP

BugSystemMenu PROC
	; Implementation of the bug tracking system menu loop
	; This will handle user input and call the appropriate functions for each menu option
	; The actual functions for registering bugs, updating severity, etc. will be defined separately
	; For now, we will just set up the menu loop structure

	pushad ; Save all general-purpose registers

bug_menu_loop:
	mov edx, OFFSET bug_menu
	call WriteString
	call ReadInt

	cmp eax, 1
	je do_reg
	cmp eax, 2
	je do_upd
	cmp eax, 3
	je do_src
	cpm eax, 4
	je do_dsp
	cmp eax, 5
	je do_avg
	cmp eax, 6
	je do_hst
	cmp eax, 7
	je do_stk
	je exit_bug_menu
	jmp bug_menu_loop

do_reg:
	; Call the function to register a new bug
	call RegisterBug
	jmp bug_menu_loop
do_upd:
	; Call the function to update a bug severity level
	call UpdateBug
	jmp bug_menu_loop

do_src:
	; Call the function to search for a bug by its ID
	call SearchBug
	jmp bug_menu_loop
do_dsp:
	; Call the function to display all bugs
	call DisplayBugs
	jmp bug_menu_loop

do_avg:
	; Call the function to view average resolution time
	call AverageBugTime
	jmp bug_menu_loop

do_hst:
	; Call the function to view last 5 debugging history actions
	call ViewHistory
	jmp bug_menu_loop

do_stk:
	; Call the function to test stack execution flow demo
	call StackDemoProc1
	jmp bug_menu_loop

exit_bug_menu:
	popad ; Restore all general-purpose registers
	ret

BugSystemMenu ENDP

RegisterBug PROC
	; Implementation of the function to register a new bug
	; This will involve reading user input for bug details, validating the input, and storing it in the appropriate data structures
	; We will also need to check for duplicate bug IDs and ensure we do not exceed the maximum number of bugs
	pushad ; Save all general-purpose registers
	; Check if we have reached the maximum number of bugs
	mov eax, bug_count
	cmp eax, MAX_BUGS
	jb space_available
	; Read bug ID
	mov edx, OFFSET p_bug_full
	call WriteString
	jmp reg_fail

space_available:
	mov edx, OFFSSET p_bug_id
	call WriteString
	call ReadInt
	mov esi, eax ; Store the entered bug ID in esi for later use

	mov ecx, 0

dup_check_loop:
	cmp ecx, bug_count
	jae dup_check_done
	mov eax, bug_ids[ecx*4] ; Get the bug ID at index ecx
	cmp eax, esi ; Compare with the entered bug ID
	je duplicate_err
	inc ecx
	jmp dup_check_loop

duplicate_err:
	mov edx, OFFSET err_bug_dup
	call WriteString
	jmp reg_fail

dup_check_done:
	mov edx, OFFSET p_bug_sev
	call WriteString
	call ReadInt
	cmp eax, 1 
	jb sev_err
	cmp eax, 3
	ja sev_err
	jmp sev_ok

sev_err:
	mov edx, OFFSET err_bug_sev
	call WriteString
	jmp reg_fail

sev_ok:
	mov edi, eax ; Store the entered severity level in edi for later use

	mov edx, OFFSET err_bug_dev
	call WriteString
	call ReadInt
	cmp eax, 100
	jb dev_err
	cmp eax, 999
	ja dev_err
	jmp dev_ok

dev_err:
	mov edx, OFFSET err_bug_dev
	call WriteString
	jmp reg_fail

dev_ok:
	mov ebx, eax ; Store the entered developer ID in ebx for later use
	mov edx, OFFSET p_bug_mod
	call WriteString
	; We will need to read a string input for the module name and validate it (up to 15 chars, no spaces)
	; For simplicity, we will assume the user enters a valid module name without spaces
	; In a real implementation, we would need to read the string and check for spaces and length
	; Here we will just skip this validation for now
	; Read bug status

	mov eax, bug_count
	shl eax, 4 ; Multiply bug_count by 16 to get the offset for the module name
	mov edx, OFFSET bug_modules
	add edx, eax ; Point to the correct location for the module name
	mov ecx, 15 ; Maximum length of module name
	call ReadString ; Read the module name into the bug_modules array
	cmp eax, 0 ; Check if the user entered a valid module name (not empty)
	jne mod_ok
	mov edx, OFFSET err_bug_mod
	call WriteString
	jmp reg_fail

mod_ok:
	mov edx, OFFSET p_bug_time
	call WriteString
	call ReadInt
	mov ebp, eax
	
	mov edx, OFFSET p_bug_status
	call WriteString
	call ReadInt
	cmp eax, 1
	je status_validated
	mov eax, 0 ; If not 1, we will treat it as 0 (open)

status_validated:
	mov ecx, bug_count
	mov bug_ids[ecx*4], esi ; Store the bug ID
	mov bug_severities[ecx*4], edi ; Store the severity level
	mov bug_developers[ecx*4], ebx ; Store the developer ID
	mov bug_times[ecx*4], ebp ; Store the resolution time
	mov bug_statuses[ecx*4], eax ; Store the bug status

	inc bug_count ; Increment the bug count
	mov edx, OFFSET bug_action_msg
	call LogHistoryAction ; Log the action of registering a new bug
	jmp reg_success

reg_fail:
reg_success:
	popad ; Restore all general-purpose registers
	ret
registerBug ENDP

updateBug PROC
	pushad ; Save all general-purpose registers

	cmp bug_count, 0
	jne update_db_not_empty
	mov edx, OFFSET err_bug_empty
	call WriteString
	jmp update_exit


update_db_not_empty:
	mov edx, OFFSET p_bug_id
	call WriteString
	call ReadInt
	mov esi, eax ; Store the entered bug ID in esi for later use
	mov ecx, 0


find_bug_loop:
	cmp ecx, bug_count
	jae bug_not_found
	cmp bug_ids[ecx*4], esi ; Get the bug ID at index ecx
	je found_bug_to_update
	inc ecx
	jmp find_bug_loop


bug_not_found:
	mov edx, OFFSET err_bug_notfound
	call WriteString
	jmp update_exit

found_bug_to_update:
	mov edx, OFFSET p_bug_sev
	call WriteString
    call ReadInt
    cmp eax, 1
    jb upd_sev_err
    cmp eax, 3
    ja upd_sev_err
    mov bug_severities[ecx*4], eax
    jmp upd_sev_ok

upd_sev_err:
    mov edx, OFFSET err_bug_sev
    call WriteString
upd_sev_ok:

    mov edx, OFFSET p_bug_status
    call WriteString
    call ReadInt
    cmp eax, 1
    je status_set_1
    mov eax, 0
status_set_1:
    mov bug_statuses[ecx*4], eax

    mov edx, OFFSET bug_upd_msg
    call LogHistoryAction

update_exit:
    popad
    ret
UpdateBug ENDP


SearchBug PROC
    pushad
    cmp bug_count, 0
    jne search_start
    mov edx, OFFSET err_bug_empty
    call WriteString
    jmp search_exit

search_start:
    mov edx, OFFSET p_bug_id
    call WriteString
    call ReadInt
    mov esi, eax

    mov ecx, 0
search_loop:
    cmp ecx, bug_count
    jae s_not_found
    cmp bug_ids[ecx*4], esi
    je s_found
    inc ecx
    jmp search_loop

s_not_found:
    mov edx, OFFSET err_bug_notfound
    call WriteString
    jmp search_exit

s_found:
    call PrintBugHeader
    call PrintBugRow
    
    mov edx, OFFSET bug_src_msg
    call LogHistoryAction

search_exit:
    popad
    ret
SearchBug ENDP


DisplayBugs PROC
    pushad
    cmp bug_count, 0
    jne display_start
    mov edx, OFFSET err_bug_empty
    call WriteString
    jmp display_exit

display_start:
    call PrintBugHeader
    mov ecx, 0
display_loop:
    cmp ecx, bug_count
    jae display_exit
    call PrintBugRow
    inc ecx
    jmp display_loop

display_exit:
    popad
    ret
DisplayBugs ENDP


PrintBugHeader PROC
    mov edx, OFFSET t_header
    call WriteString
    ret
PrintBugHeader ENDP

PrintBugRow PROC
    pushad 
    
    mov eax, bug_ids[ecx*4]
    call WriteDec
    mov edx, OFFSET t_bar
    call WriteString

    mov eax, bug_severities[ecx*4]
    cmp eax, 1
    je print_c
    cmp eax, 2
    je print_ma
    mov edx, OFFSET t_min
    jmp print_sev_done
print_c:
    mov edx, OFFSET t_crit
    jmp print_sev_done
print_ma:
    mov edx, OFFSET t_maj
print_sev_done:
    call WriteString
    mov edx, OFFSET t_bar
    call WriteString

    mov eax, bug_developers[ecx*4]
    call WriteDec
    mov edx, OFFSET t_bar
    call WriteString

    mov eax, bug_statuses[ecx*4]
    cmp eax, 1
    je print_resolved
    mov edx, OFFSET t_open
    jmp print_stat_done
print_resolved:
    mov edx, OFFSET t_res
print_stat_done:
    call WriteString
    mov edx, OFFSET t_bar
    call WriteString

    mov eax, bug_times[ecx*4]
    call WriteDec
    mov edx, OFFSET t_bar
    call WriteString

    mov eax, ecx
    shl eax, 4
    mov edx, OFFSET bug_modules
    add edx, eax
    call WriteString
    
    call Crdlf
    popad
    ret
PrintBugRow ENDP


AverageBugTime PROC
    pushad
    cmp bug_count, 0
    je no_bugs_avg

    mov ebx, 0 
    mov edi, 0 
    mov ecx, 0 

avg_loop:
    cmp ecx, bug_count
    jae avg_calc
    cmp bug_statuses[ecx*4], 1 
    jne avg_skip
    add ebx, bug_times[ecx*4]
    inc edi
avg_skip:
    inc ecx
    jmp avg_loop

avg_calc:
    cmp edi, 0
    je no_bugs_avg
    
    mov edx, OFFSET msg_avg_time
    call WriteString
    
    mov eax, ebx
    mov edx, 0 
    div edi
    call WriteDec
    mov edx, OFFSET msg_hours
    call WriteString
    jmp avg_exit

no_bugs_avg:
    mov edx, OFFSET msg_no_res
    call WriteString

avg_exit:
    popad
    ret
AverageBugTime ENDP


LogHistoryAction PROC
    pushad
    
    mov ecx, hist_count
    cmp ecx, 5
    jl write_log_direct
    
    push esi
    push edi
    mov ecx, 0
shift_log_loop:
    cmp ecx, 4
    jae shift_log_done
    mov eax, ecx
    shl eax, 5 
    mov edi, OFFSET hist_messages
    add edi, eax
    
    mov ebx, ecx
    inc ebx
    shl ebx, 5 
    mov esi, OFFSET hist_messages
    add esi, ebx
    
    push ecx
    mov ecx, 32
    cld
    rep movsb
    pop ecx
    
    inc ecx
    jmp shift_log_loop
shift_log_done:
    pop edi
    pop esi
    mov ecx, 4 
    
write_log_direct:
    mov eax, ecx
    shl eax, 5
    mov edi, OFFSET hist_messages
    add edi, eax
    mov esi, edx
    
copy_str_loop:
    mov al, [esi]
    mov [edi], al
    cmp al, 0
    je string_copy_done
    inc esi
    inc edi
    jmp copy_str_loop

string_copy_done:
    mov eax, hist_count
    cmp eax, 5
    jge hist_clamp
    inc hist_count
hist_clamp:
    popad
    ret
LogHistoryAction ENDP

ViewHistory PROC
    pushad
    mov edx, OFFSET msg_hist_title
    call WriteString
    
    cmp hist_count, 0
    jne print_history_records
    mov edx, OFFSET msg_hist_empty
    call WriteString
    jmp history_exit

print_history_records:
    mov ecx, 0
print_hist_loop:
    cmp ecx, hist_count
    jae history_exit
    
    mov eax, ecx
    shl eax, 5
    mov edx, OFFSET hist_messages
    add edx, eax
    call WriteString
    call Crdlf
    inc ecx
    jmp print_hist_loop

history_exit:
    popad
    ret
ViewHistory ENDP


StackDemoProc1 PROC
    pushad
    mov edx, OFFSET stack_msg_1
    call WriteString
    mov eax, esp
    call WriteHex
    call Crdlf
    
    call StackDemoProc2
    
    mov edx, OFFSET stack_msg_3
    call WriteString
    mov eax, esp
    call WriteHex
    call Crdlf
    popad
    ret
StackDemoProc1 ENDP

StackDemoProc2 PROC
    pushad
    mov edx, OFFSET stack_msg_2
    call WriteString
    mov eax, esp
    call WriteHex
    call Crdlf
    popad
    ret
StackDemoProc2 ENDP


; =============================================================================
;                       AGILE SPRINT MANAGEMENT SYSTEM MODULES
; =============================================================================

SprintSystemMenu PROC
    pushad
sprint_menu_loop:
    mov edx, OFFSET sprint_menu
    call WriteString
    call ReadInt

    cmp eax, 1
    je t_add
    cmp eax, 2
    je t_wkl
    cmp eax, 3
    je t_anl
    cmp eax, 4
    je t_dsp
    cmp eax, 5
    je t_upd
    cmp eax, 6
    je exit_sprint_menu
    jmp sprint_menu_loop

t_add: call AddSprintTask        jmp sprint_menu_loop
t_wkl: call DevWorkloadCalc      jmp sprint_menu_loop
t_anl: call SprintAnalytics      jmp sprint_menu_loop
t_dsp: call DisplaySprintTasks   jmp sprint_menu_loop
t_upd: call FixAllocationConflict jmp sprint_menu_loop

exit_sprint_menu:
    popad
    ret
SprintSystemMenu ENDP


AddSprintTask PROC
    pushad
    
    mov eax, task_count
    cmp eax, MAX_TASKS
    jb sprint_room_ok
    mov edx, OFFSET err_task_full
    call WriteString
    jmp add_task_fail

sprint_room_ok:
    mov edx, OFFSET p_task_id
    call WriteString
    call ReadInt
    mov esi, eax

    mov ecx, 0
t_dup_loop:
    cmp ecx, task_count
    jae t_dup_ok
    cmp task_ids[ecx*4], esi
    je t_dup_err
    inc ecx
    jmp t_dup_loop
t_dup_err:
    mov edx, OFFSET err_task_dup
    call WriteString
    jmp add_task_fail

t_dup_ok:
    mov edx, OFFSET p_task_dev
    call WriteString
    call ReadInt
    cmp eax, 100
    jb dev_id_err
    cmp eax, 999
    ja dev_id_err
    jmp dev_id_ok
dev_id_err:
    mov edx, OFFSET err_bug_dev
    call WriteString
    jmp add_task_fail

dev_id_ok:
    mov edi, eax

    mov edx, OFFSET p_task_pri
    call WriteString
    call ReadInt
    cmp eax, 1
    jb pri_err
    cmp eax, 3
    ja pri_err
    jmp pri_ok
pri_err:
    mov edx, OFFSET err_bug_sev
    call WriteString
    jmp add_task_fail
pri_ok:
    mov ebx, eax

    mov edx, OFFSET p_task_hour
    call WriteString
    call ReadInt
    mov ebp, eax

    mov edx, OFFSET p_task_status
    call WriteString
    call ReadInt
    cmp eax, 1
    je stat_v
    mov eax, 0
stat_v:
    mov edx, eax 

    push edx
    mov edx, OFFSET p_task_sprint
    call WriteString
    call ReadInt
    cmp eax, 1
    jb sprint_err
    cmp eax, 50
    ja sprint_err
    pop edx
    jmp sprint_ok
sprint_err:
    pop edx
    mov edx, OFFSET err_task_sprint
    call WriteString
    jmp add_task_fail

sprint_ok:
    mov ecx, task_count
    mov task_ids[ecx*4], esi
    mov task_dev_ids[ecx*4], edi
    mov task_priorities[ecx*4], ebx
    mov task_hours[ecx*4], ebp
    mov task_statuses[ecx*4], edx
    mov task_sprints[ecx*4], eax

    inc task_count
    jmp add_task_success

add_task_fail:
add_task_success:
    popad
    ret
AddSprintTask ENDP


DevWorkloadCalc PROC
    pushad
    cmp task_count, 0
    jne wkl_start
    mov edx, OFFSET err_task_empty
    call WriteString
    jmp wkl_exit

wkl_start:
    mov edx, OFFSET p_search_dev
    call WriteString
    call ReadInt
    mov esi, eax 

    mov ebx, 0 
    mov ecx, 0 

wkl_loop:
    cmp ecx, task_count
    jae wkl_done
    cmp task_dev_ids[ecx*4], esi
    jne wkl_skip
    
    add ebx, task_hours[ecx*4]
    jo wkl_overflow

wkl_skip:
    inc ecx
    jmp wkl_loop

wkl_done:
    mov edx, OFFSET msg_dev_workload
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crdlf
    jmp wkl_exit

wkl_overflow:
    mov edx, OFFSET err_task_overflow
    call WriteString

wkl_exit:
    popad
    ret
DevWorkloadCalc ENDP


SprintAnalytics PROC
    pushad
    cmp task_count, 0
    jne anl_start
    mov edx, OFFSET err_task_empty
    call WriteString
    jmp anl_exit

anl_start:
    mov edx, OFFSET msg_analytics
    call WriteString

    mov ebx, 0 
    mov edi, 0 
    mov ebp, 0 
    mov ecx, 0 

anl_loop:
    cmp ecx, task_count
    jae anl_math
    
    cmp task_priorities[ecx*4], 1
    jne check_pending
    inc ebx
check_pending:
    cmp task_statuses[ecx*4], 0
    jne check_complete
    inc edi
check_complete:
    cmp task_statuses[ecx*4], 1
    jne anl_loop_skip
    inc ebp
anl_loop_skip:
    inc ecx
    jmp anl_loop

anl_math:
    mov edx, OFFSET msg_pct_comp
    call WriteString
    
    mov eax, ebp
    mov edx, 100
    mul edx 
    
    mov div_err_guard, eax 
    mov eax, div_err_guard
    mov edx, 0
    div task_count
    call WriteDec
    mov edx, OFFSET msg_pct_sign
    call WriteString

    mov edx, OFFSET msg_cat_counts
    call WriteString
    mov eax, ebx
    call WriteDec
    
    mov edx, OFFSET msg_cat_pend
    call WriteString
    mov eax, edi
    call WriteDec

    mov edx, OFFSET msg_cat_comp
    call WriteString
    mov eax, ebp
    call WriteDec
    call Crdlf

anl_exit:
    popad
    ret
SprintAnalytics ENDP


DisplaySprintTasks PROC
    pushad
    cmp task_count, 0
    jne dsp_t_start
    mov edx, OFFSET err_task_empty
    call WriteString
    jmp dsp_t_exit

dsp_t_start:
    mov edx, OFFSET t_task_header
    call WriteString
    mov ecx, 0

dsp_t_loop:
    cmp ecx, task_count
    jae dsp_t_exit
    
    mov eax, task_ids[ecx*4]
    call WriteDec
    mov edx, OFFSET t_space
    call WriteString

    mov eax, task_dev_ids[ecx*4]
    call WriteDec
    mov edx, OFFSET t_space
    call WriteString

    mov eax, task_priorities[ecx*4]
    cmp eax, 1
    je pr_h
    cmp eax, 2
    je pr_m
    mov edx, OFFSET t_low
    jmp pr_d
pr_h:  mov edx, OFFSET t_high  jmp pr_d
pr_m:  mov edx, OFFSET t_med
pr_d:  call WriteString
    mov edx, OFFSET t_space
    call WriteString

    mov eax, task_hours[ecx*4]
    call WriteDec
    mov edx, OFFSET t_space
    call WriteString

    mov eax, task_statuses[ecx*4]
    cmp eax, 1
    je st_c
    mov edx, OFFSET t_pending
    jmp st_d
st_c:  mov edx, OFFSET t_complete
st_d:  call WriteString
    mov edx, OFFSET t_space
    call WriteString

    mov eax, task_sprints[ecx*4]
    call WriteDec
    call Crdlf

    inc ecx
    jmp dsp_t_loop

dsp_t_exit:
    popad
    ret
DisplaySprintTasks ENDP


FixAllocationConflict PROC
    pushad
    cmp task_count, 0
    jne fix_alloc_start
    mov edx, OFFSET err_task_empty
    call WriteString
    jmp fix_alloc_exit

fix_alloc_start:
    mov edx, OFFSET p_task_id
    call WriteString
    call ReadInt
    mov esi, eax

    mov ecx, 0
fix_search_loop:
    cmp ecx, task_count
    jae fix_not_found
    cmp task_ids[ecx*4], esi
    je fix_found
    inc ecx
    jmp fix_search_loop

fix_not_found:
    mov edx, OFFSET err_bug_notfound
    call WriteString
    jmp fix_alloc_exit

fix_found:
    mov edx, OFFSET p_task_dev
    call WriteString
    call ReadInt
    cmp eax, 100
    jb fix_err_out
    cmp eax, 999
    ja fix_err_out
    mov task_dev_ids[ecx*4], eax

    mov edx, OFFSET p_task_hour
    call WriteString
    call ReadInt
    mov task_hours[ecx*4], eax
    jmp fix_alloc_exit

fix_err_out:
    mov edx, OFFSET err_bug_dev
    call WriteString

fix_alloc_exit:
    popad
    ret
FixAllocationConflict ENDP


Crdlf PROC
    push edx
    mov edx, OFFSET msg_newline
    call WriteString
    pop edx
    ret
Crdlf ENDP

END main