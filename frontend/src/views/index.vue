<template>
  <div class="dashboard-container">
    <!-- 欢迎语 -->
    <div class="welcome-box">
      <h2>欢迎使用校园智慧通管理系统 👋</h2>
      <p>眼底有星河，心中有丘壑，愿求学之路温故知新，不负韶华，不负年少初心！！！</p >
    </div>

    <!-- 项目简介 -->
    <div class="project-intro">
      <h3>系统简介</h3>
      <p>校园智慧通管理系统是一款面向校园综合服务的智能化管理平台，集成用户管理、课程管理、护理服务、订单管理、数据统计等功能，实现校园服务数字化、高效化、智能化管理。</p >
      <p>系统操作简单、界面简洁，适用于校园管理人员、教职工及学生使用，全面提升校园服务与管理效率。</p >
    </div>
  </div>
</template>

<script>
export default {
  name: "Index"
};
</script>

<style scoped>
.dashboard-container {
  padding: 25px;
  background: #f5f7fa;
  min-height: calc(100vh - 80px);
}


/* 欢迎语 */
.welcome-box {
  background: #fff;
  padding: 25px 30px;
  border-radius: 10px;
  margin-bottom: 20px;
  box-shadow: 0 1px 10px rgba(0, 0, 0, 0.05);
  /* 可选：如果希望整个盒子内容都居中，也可以在这里加 text-align: center; */
}

.welcome-box h2 {
  margin: 0 0 8px 0;
  font-size: 32px; /* 修改：增大字体，原为 24px */
  color: #2c3e50;
  text-align: center; /* 新增：文字居中 */
}

.welcome-box p {
  margin: 0;
  color: #7f8c8d;
  font-size: 18px; /* 修改：增大字体，原为 15px */
  text-align: center; /* 新增：文字居中 */
}

/* 项目简介 */
.project-intro {
  background: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 1px 10px rgba(0, 0, 0, 0.05);
}
.project-intro h3 {
  font-size: 20px;
  color: #2c3e50;
  margin-bottom: 15px;
}
.project-intro p {
  font-size: 15px;
  line-height: 1.8;
  color: #555;
  margin-bottom: 10px;
}
</style>