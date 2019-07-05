package com.example.hadoopdemo.config;

import com.example.hadoopdemo.HadoopClient;
import com.example.hadoopdemo.props.HadoopProperties;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.hadoop.fs.FileSystem;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.net.URI;

/**
 * @author Ruison
 * on 2019/7/4 - 10:21
 */
@Configuration
@ConditionalOnProperty(name="hadoop.name-node")
@Slf4j
public class HadoopConfig {

    @Bean
    public FileSystem fs(HadoopProperties hadoopProperties){
        //读取配置文件
        org.apache.hadoop.conf.Configuration conf = new org.apache.hadoop.conf.Configuration();
        conf.set("dfs.replication", "1");
        conf.set("fs.defaultFS", hadoopProperties.getNameNode());
        // 文件系统
        FileSystem fs = null;
        try {
            URI uri = new URI(hadoopProperties.getDirectoryPath().trim());
            fs = FileSystem.get(uri, conf);
        } catch (Exception e) {
            log.error("【FileSystem配置初始化失败】", e);
        }
        return fs;
    }

    @Bean
    @ConditionalOnBean(FileSystem.class)
    public HadoopClient hadoopClient(FileSystem fs, HadoopProperties hadoopProperties) {
        return new HadoopClient(fs, hadoopProperties);
    }
}
