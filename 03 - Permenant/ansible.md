---
cssclasses:
  - center-images
  - center-titles
created: "[[2026-03-23]]"
---
Tags: #ansible
# ansible

![[ansible.png]]

- Configuration management + *automation* + *orchestration tool*
- "Run the same operations across many machines, consistently."
- Agentless architecture makes it easy to setup with low maintenance overhead for infrastructure 

## Components
#### Control Node
- Machine from which you run the *ansible* cli tools
- You can also run Ansible in containers known as *Execution Environments*
- Where ansible is installed 
- Runs *playbooks*, Automation
#### Managed Nodes
- Target servers (no agent) 
- Hosts like servers, network, appliances or any computer
- Servers being configured
#### Inventory
- List of servers or *managenend nodes*, hosts
- Used for *assigning groups*, that both allow for node selection in the play and bulk variable assignment
#### Playbook
- *Execution concept* and how we describe the files on which *ansible-playbook* operate
- *YAML* instructions

#### Plays
- Main context for ansible execution, this playbook object maps managed nodes to tasks
- Contains *variables, roles* and an *ordered lists* of tasks and can be run repeatedly
- Consists of an *implicit* loop over the mapped hosts and tasks defines how to iterate over them

##### Roles
- Standardized way to organize playbooks and related files into reuseable, modular units with predefined file structure
- A limited distribution of reuseable ansible content (tasks, handlers) for use inside of a Play

##### Tasks
- The definition of an *action* to be applied to the *managed hosts*
- You can execute a single task once with an ad hoc command using `ansible` or `ansible-console` (both create a virtual Play).

#### Modules
## Execution flow

- You run `ansible-playbook deploy.yml`
- Ansible reads **inventory**
- Opens SSH connections
- Copies module to remote host
- Executes module
- Returns JSON result
- Deletes temporary module
- Moves to next task
### Inventory
- Like *hosts*
- List of hosts
- Things that will controll
- Linux hosts, contaner, routers
```ini
[web]
web1
web2

[db]
db1
```

### Playbook
- describing desired state
```
- hosts: web
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
```

### Module
- *prebuilt functionality*
- Ex
	- apt
	- yum
	- copy
	- file
	- service
	- git
- You don’t write shell — you declare state.
- Small scripts executed remotely, that are pushed to *hosts* to *perform tasks*
- The code or binariew thaw Ansiblw copiew to and executes on each managed node (when needed) to accomplish the action defined in each Task.
- Units of work (install package, copy files, etc...)
- Called *Task plugins* or *library plugins*, are standalone units of code that perform specific task. 
- Modules are what Ansible calls when you run tasks, and they define the “what to do” logic
- Each module accpets arguments in *key-value pair* or *YAML* syntax as complex arguments

#### Handlers
- *Special task that runs only when notified by another task*
- event-driven task triggered on change

1. Trigged by `notify`
```
- name: Update nginx config
  copy:
    src: nginx.conf
    dest: /etc/nginx/nginx.conf
  notify: Restart nginx
```

2. Defined in `handlers` section
```
handlers:
  - name: Restart nginx
    service:
      name: nginx
      state: restarted
```

3. Execution semantics
### Task
- Single action
```
- name: install nginx
```

### Play
- Mapping of *hosts + tasks*
```
- hosts: arch
```

![[ansible-rule.png]]

### Ansible vs Chef vs Puppet
![[ansible-chef-puppet.png]]