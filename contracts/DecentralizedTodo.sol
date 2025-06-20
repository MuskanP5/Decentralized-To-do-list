// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DecentralizedTodo {
    struct Task {
        uint256 id;
        string content;
        bool isCompleted;
        address creator;
    }

    uint256 public taskCount;
    mapping(uint256 => Task) public tasks;

    event TaskCreated(uint256 id, string content, address creator);
    event TaskCompleted(uint256 id, bool isCompleted);
    event TaskDeleted(uint256 id);

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false, msg.sender);
        emit TaskCreated(taskCount, _content, msg.sender);
    }

    function toggleComplete(uint256 _id) public {
        Task storage task = tasks[_id];
        require(task.creator == msg.sender, "Not your task");
        task.isCompleted = !task.isCompleted;
        emit TaskCompleted(_id, task.isCompleted);
    }

    function deleteTask(uint256 _id) public {
        Task storage task = tasks[_id];
        require(task.creator == msg.sender, "Not your task");
        delete tasks[_id];
        emit TaskDeleted(_id);
    }

    function getTask(uint256 _id) public view returns (Task memory) {
        return tasks[_id];
    }
}
